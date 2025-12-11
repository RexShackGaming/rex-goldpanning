Config = {}

-- set the reward items
Config.RewardItems = {
    'smallnugget',
    'mediumnugget',
    'largenugget',
}

-- set the amount of nuggets to give
Config.GoldChance = 65 -- % chance to find anything
Config.SmallRewardAmount  = 1
Config.MediumRewardAmount = 2
Config.LargeRewardAmount  = 3
Config.Cooldown = 10 -- seconds between pans

-- Movement system
Config.MinMovementDistance = 1.5 -- Minimum distance to move before the player can goldpan again
Config.SpotMemoryTime = 300000 -- 5 minutes in milliseconds

Config.WaterTypes = {
    [1] =  {['name'] = 'San Luis River',       ['waterhash'] = -1504425495, ['watertype'] = 'river'},
    [2] =  {['name'] = 'Upper Montana River',  ['waterhash'] = -1781130443, ['watertype'] = 'river'},
    [3] =  {['name'] = 'Owanjila',             ['waterhash'] = -1300497193, ['watertype'] = 'river'},
    [4] =  {['name'] = 'HawkEye Creek',        ['waterhash'] = -1276586360, ['watertype'] = 'river'},
    [5] =  {['name'] = 'Little Creek River',   ['waterhash'] = -1410384421, ['watertype'] = 'river'},
    [6] =  {['name'] = 'Dakota River',         ['waterhash'] = 370072007,   ['watertype'] = 'river'},
    [7] =  {['name'] = 'Beartooth Beck',       ['waterhash'] = 650214731,   ['watertype'] = 'river'},
    [8] =  {['name'] = 'Deadboot Creek',       ['waterhash'] = 1245451421,  ['watertype'] = 'river'},
    [9] =  {['name'] = 'Spider Gorge',         ['waterhash'] = -218679770,  ['watertype'] = 'river'},
    [10] =  {['name'] = 'Roanoke Valley',      ['waterhash'] = -1229593481, ['watertype'] = 'river'},
    [11] =  {['name'] = 'Lannahechee River',   ['waterhash'] = -2040708515, ['watertype'] = 'river'},
    [12] =  {['name'] = 'Random1',             ['waterhash'] = 231313522,   ['watertype'] = 'river'},
    [13] =  {['name'] = 'Random2',             ['waterhash'] = 2005774838,  ['watertype'] = 'river'},
    [14] =  {['name'] = 'Random3',             ['waterhash'] = -1287619521, ['watertype'] = 'river'},
    [15] =  {['name'] = 'Random4',             ['waterhash'] = -1308233316, ['watertype'] = 'river'},
    [16] =  {['name'] = 'Random5',             ['waterhash'] = -196675805,  ['watertype'] = 'river'},
    [17] =  {['name'] = 'Arroyo De La Vibora', ['waterhash'] = -49694339,   ['watertype'] = 'river'},
}
