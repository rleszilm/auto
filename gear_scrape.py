slots = ['head', 'body', 'hands', 'legs', 'feet']
data = [
    ("Despair",
        ["helm", "mail", 'finger gauntlets', 'cuisses', 'greaves'],
        ["""HP+50
VIT+10
Potency of "Cure" effect received+5%""",
            """STR+12
VIT+7
Haste+2%""",
            """Accuracy+10
Pet: VIT+7
Pet: Damage Taken-3%"""],
        ["""STR+15
Enmity+7
"Store TP"+3""",
        """Attack+25
Magic Evasion+20
"Double Attack"+3""",
        """Ranged Accuracy+25
Ranged Attack+20
"Recycle"+10""",
        """AGI+10
Evasion+20
Subtle Blow+7""",
        """DEX+10
STR+7
Physical Damage Taken-3%"""])
]

def augment(txt):
    augs = ["'" + a.strip() + "'" for a in  txt.split("\n")]
    return "{" + ",".join(augs) + "}"

def iteml(s, i, a):
    return "{{name=\"{name} {item}\", augments={aug}}}".format(name=s, item=i, aug=augment(a))

for d in data:
    name, item, abcAugments, dAugments = d

    augA = augment(abcAugments[0])
    augB = augment(abcAugments[1])
    augC = augment(abcAugments[2])

    head = iteml(name, item[0], dAugments[0])
    body = iteml(name, item[1], dAugments[1])
    hands = iteml(name, item[2], dAugments[2])
    legs = iteml(name, item[3], dAugments[3])
    feet = iteml(name, item[4], dAugments[4])

    print """{{
    Name = "{name}",
    Augments = {{
        A = {augA},
        B = {augB},
        C = {augC},
        head  = {head},
        body  = {body},
        hands = {hands},
        legs  = {legs},
        feet  = {feet},
    }}
}},""".format(name=name, augA=augA, augB=augB, augC=augC, head=head, body=body, hands=hands, legs=legs, feet=feet)
