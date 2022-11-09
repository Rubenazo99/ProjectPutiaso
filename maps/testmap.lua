return {
  version = "1.9",
  luaversion = "5.1",
  tiledversion = "1.9.2",
  class = "",
  orientation = "orthogonal",
  renderorder = "left-up",
  width = 34,
  height = 200,
  tilewidth = 16,
  tileheight = 16,
  nextlayerid = 18,
<<<<<<< HEAD
  nextobjectid = 317,
=======
  nextobjectid = 311,
>>>>>>> parent of 81e8bb8 (Revert "Update testmap.lua")
  properties = {},
  tilesets = {
    {
      name = "testTileset",
      firstgid = 1,
      class = "",
      tilewidth = 16,
      tileheight = 16,
      spacing = 0,
      margin = 0,
      columns = 16,
      image = "testTileset.png",
      imagewidth = 256,
      imageheight = 352,
      objectalignment = "unspecified",
      tilerendersize = "tile",
      fillmode = "stretch",
      tileoffset = {
        x = 0,
        y = 0
      },
      grid = {
        orientation = "orthogonal",
        width = 16,
        height = 16
      },
      properties = {},
      wangsets = {},
      tilecount = 352,
      tiles = {}
    }
  },
  layers = {
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 14,
      name = "Players",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 111,
          name = "PlayerB",
          class = "",
          shape = "rectangle",
          x = 293.333,
          y = 2080,
          width = 24,
          height = 24,
          rotation = 0,
          visible = true,
          properties = {
            ["attackKey"] = "kp7",
            ["colorB"] = 0,
            ["colorG"] = 1,
            ["colorR"] = 0,
            ["jumpKey"] = "up",
            ["leftMovementKey"] = "left",
            ["rightMovementKey"] = "right"
          }
        },
        {
          id = 109,
          name = "PlayerA",
          class = "",
          shape = "rectangle",
          x = 223.333,
          y = 2082,
          width = 24,
          height = 24,
          rotation = 0,
          visible = true,
          properties = {
            ["attackKey"] = "e",
            ["colorB"] = 1,
            ["colorG"] = 0,
            ["colorR"] = 0,
            ["jumpKey"] = "w",
            ["leftMovementKey"] = "a",
            ["rightMovementKey"] = "d"
          }
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 12,
      name = "Wall",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 94,
          name = "2",
          class = "",
          shape = "rectangle",
          x = -16,
          y = -0.666667,
          width = 48,
          height = 3200.67,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 95,
          name = "1",
          class = "",
          shape = "rectangle",
          x = 512,
          y = 1.33333,
          width = 48,
          height = 3198.67,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 220,
          name = "7",
          class = "",
          shape = "rectangle",
          x = 400,
          y = 1880.16,
          width = 30,
          height = 83.67,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 221,
          name = "8",
          class = "",
          shape = "rectangle",
          x = 112,
          y = 1872,
          width = 35,
          height = 83.67,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 225,
          name = "",
          class = "",
          shape = "rectangle",
          x = 176,
          y = 2832,
          width = 32,
          height = 80,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 226,
          name = "",
          class = "",
          shape = "rectangle",
          x = 336,
          y = 2832,
          width = 32,
          height = 80,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 240,
          name = "",
          class = "",
          shape = "rectangle",
          x = 160,
          y = 2528,
          width = 32,
          height = 80,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 241,
          name = "",
          class = "",
          shape = "rectangle",
          x = 80,
          y = 2400,
          width = 16,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 245,
          name = "",
          class = "",
          shape = "rectangle",
          x = 80,
          y = 2720,
          width = 16,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 246,
          name = "",
          class = "",
          shape = "rectangle",
          x = 352,
          y = 2528,
          width = 32,
          height = 80,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 250,
          name = "",
          class = "",
          shape = "rectangle",
          x = 448,
          y = 2720,
          width = 16,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 252,
          name = "",
          class = "",
          shape = "rectangle",
          x = 448,
          y = 2400,
          width = 16,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 256,
          name = "",
          class = "",
          shape = "rectangle",
<<<<<<< HEAD
          x = 108.278,
          y = 2192.13,
          width = 17.8605,
          height = 32,
=======
          x = 111.333,
          y = 2877.91,
          width = 16.6667,
          height = 34.0909,
>>>>>>> parent of 81e8bb8 (Revert "Update testmap.lua")
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 262,
          name = "",
          class = "",
          shape = "rectangle",
          x = 112.5,
          y = 1700.5,
          width = 32.2196,
          height = 92.5,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 263,
          name = "",
          class = "",
          shape = "rectangle",
          x = 174.39,
          y = 1761.25,
          width = 17.7196,
          height = 31.5,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 264,
          name = "",
          class = "",
          shape = "rectangle",
          x = 367,
          y = 1760,
          width = 17,
          height = 29,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 267,
          name = "",
          class = "",
          shape = "rectangle",
          x = 325,
          y = 1631.5,
          width = 15,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 269,
          name = "",
          class = "",
          shape = "rectangle",
          x = 225,
          y = 1631,
          width = 14.5,
          height = 31.5,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 270,
          name = "",
          class = "",
          shape = "rectangle",
          x = 367,
          y = 1487.5,
          width = 18,
          height = 31.5,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 271,
          name = "",
          class = "",
          shape = "rectangle",
          x = 174.5,
          y = 1490,
          width = 18,
          height = 30,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 273,
          name = "",
          class = "",
          shape = "rectangle",
          x = 335,
          y = 1346,
          width = 20,
          height = 32.5,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 274,
          name = "",
          class = "",
          shape = "rectangle",
          x = 225,
          y = 1346,
          width = 15,
          height = 31.5,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 275,
          name = "",
          class = "",
          shape = "rectangle",
          x = 398.5,
          y = 2304,
          width = 17,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 276,
          name = "",
          class = "",
          shape = "rectangle",
          x = 143.5,
          y = 2305,
          width = 15.5,
          height = 30.5,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 278,
          name = "",
          class = "",
          shape = "rectangle",
          x = 131,
          y = 2112.5,
          width = 12.5,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 279,
          name = "",
          class = "",
          shape = "rectangle",
          x = 399,
          y = 2113,
          width = 15,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 280,
          name = "",
          class = "",
          shape = "rectangle",
          x = 178,
          y = 1936,
          width = 16.5,
          height = 28.5,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 281,
          name = "",
          class = "",
          shape = "rectangle",
          x = 351,
          y = 1937.5,
          width = 17,
          height = 28,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 282,
          name = "",
          class = "",
          shape = "rectangle",
          x = 193,
          y = 1808.5,
          width = 14.5,
          height = 31,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 284,
          name = "",
          class = "",
          shape = "rectangle",
          x = 334.5,
          y = 1807.5,
          width = 15,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 286,
          name = "",
          class = "",
          shape = "rectangle",
          x = 175.5,
          y = 1246.5,
          width = 16.5,
          height = 32.5,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 287,
          name = "",
          class = "",
          shape = "rectangle",
          x = 367,
          y = 1247.5,
          width = 17.5,
          height = 31,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 288,
          name = "",
          class = "",
          shape = "rectangle",
          x = 129,
          y = 1040.5,
          width = 16.5,
          height = 32.5,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 290,
          name = "",
          class = "",
          shape = "rectangle",
          x = 222.5,
          y = 1042.5,
          width = 18,
          height = 31,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 291,
          name = "",
          class = "",
          shape = "rectangle",
          x = 335,
          y = 1042,
          width = 19,
          height = 31,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 292,
          name = "",
          class = "",
          shape = "rectangle",
          x = 416.5,
          y = 1039.5,
          width = 15.5,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 293,
          name = "",
          class = "",
          shape = "rectangle",
          x = 351.5,
          y = 766.5,
          width = 17,
          height = 32.5,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 9,
      name = "Ground",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 93,
          name = "1",
          class = "",
          shape = "rectangle",
          x = 0,
          y = 3040,
          width = 544,
          height = 48,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 148,
          name = "4",
          class = "",
          shape = "rectangle",
          x = 32,
          y = 2720,
          width = 64,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 151,
          name = "7",
          class = "",
          shape = "rectangle",
          x = 32,
          y = 2400,
          width = 64,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 155,
          name = "10",
          class = "",
          shape = "rectangle",
          x = 448,
          y = 2720,
          width = 64,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 158,
          name = "13",
          class = "",
          shape = "rectangle",
          x = 448,
          y = 2400,
          width = 64,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 159,
          name = "14",
          class = "",
          shape = "rectangle",
          x = 131,
          y = 2112,
          width = 282,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 160,
          name = "15",
          class = "",
          shape = "rectangle",
<<<<<<< HEAD
          x = 32.7083,
          y = 2192.08,
=======
          x = 35.3333,
          y = 2191.33,
>>>>>>> parent of 81e8bb8 (Revert "Update testmap.lua")
          width = 93.3333,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 161,
          name = "16",
          class = "",
          shape = "rectangle",
          x = 417.333,
          y = 2191,
          width = 93.3333,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 162,
          name = "17",
          class = "",
          shape = "rectangle",
          x = 144,
          y = 2304,
          width = 272,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 163,
          name = "18",
          class = "",
          shape = "rectangle",
          x = 112,
          y = 1936,
          width = 82,
          height = 29,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 167,
          name = "22",
          class = "",
          shape = "rectangle",
          x = 192,
          y = 1808,
          width = 157,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 168,
          name = "23",
          class = "",
          shape = "rectangle",
          x = 112,
          y = 1760,
          width = 80,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 170,
          name = "25",
          class = "",
          shape = "rectangle",
          x = 415.521,
          y = 1790.68,
          width = 88,
          height = 32,
          rotation = 270.177,
          visible = true,
          properties = {}
        },
        {
          id = 171,
          name = "26",
          class = "",
          shape = "rectangle",
          x = 366.177,
          y = 1790.2,
          width = 31,
          height = 81.3333,
          rotation = 270.177,
          visible = true,
          properties = {}
        },
        {
          id = 172,
          name = "27",
          class = "",
          shape = "rectangle",
          x = 225,
          y = 1631.5,
          width = 116,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 173,
          name = "28",
          class = "",
          shape = "rectangle",
          x = 115.334,
          y = 1488.66,
          width = 78,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 174,
          name = "29",
          class = "",
          shape = "rectangle",
          x = 115.666,
          y = 1439.33,
          width = 33,
          height = 81.3333,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 175,
          name = "30",
          class = "",
          shape = "rectangle",
          x = 415.663,
          y = 1518.67,
          width = 88,
          height = 32,
          rotation = 270,
          visible = true,
          properties = {}
        },
        {
          id = 176,
          name = "31",
          class = "",
          shape = "rectangle",
          x = 366.333,
          y = 1520.33,
          width = 33,
          height = 81.3333,
          rotation = 270,
          visible = true,
          properties = {}
        },
        {
          id = 177,
          name = "32",
          class = "",
          shape = "rectangle",
          x = 226,
          y = 1346,
          width = 129,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 182,
          name = "33",
          class = "",
          shape = "rectangle",
          x = 35.6695,
          y = 1041.16,
          width = 110,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 183,
          name = "34",
          class = "",
          shape = "rectangle",
          x = 114.002,
          y = 1197.83,
          width = 32,
          height = 81.3333,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 184,
          name = "35",
          class = "",
          shape = "rectangle",
          x = 415.999,
          y = 1278.17,
          width = 88,
          height = 32,
          rotation = 270,
          visible = true,
          properties = {}
        },
        {
          id = 185,
          name = "36",
          class = "",
          shape = "rectangle",
          x = 367.669,
          y = 1278.83,
          width = 31,
          height = 81.3333,
          rotation = 270,
          visible = true,
          properties = {}
        },
        {
          id = 186,
          name = "37",
          class = "",
          shape = "rectangle",
          x = 114,
          y = 1246,
          width = 78,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 187,
          name = "38",
          class = "",
          shape = "rectangle",
          x = 223,
          y = 1042,
          width = 131,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 188,
          name = "39",
          class = "",
          shape = "rectangle",
          x = 417,
          y = 1039,
          width = 96,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 189,
          name = "40",
          class = "",
          shape = "rectangle",
          x = 129.501,
          y = 718.833,
          width = 31,
          height = 81.3333,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 190,
          name = "42",
          class = "",
          shape = "rectangle",
          x = 129.499,
          y = 767.503,
          width = 88,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 191,
          name = "42",
          class = "",
          shape = "rectangle",
          x = 351.874,
          y = 799.146,
          width = 31.0169,
          height = 81.3333,
          rotation = 270.476,
          visible = true,
          properties = {}
        },
        {
          id = 192,
          name = "43",
          class = "",
          shape = "rectangle",
          x = 403.233,
          y = 797.541,
          width = 88,
          height = 32,
          rotation = 270.476,
          visible = true,
          properties = {}
        },
        {
          id = 197,
          name = "44",
          class = "",
          shape = "rectangle",
          x = 241.165,
          y = 620.833,
          width = 92,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 199,
          name = "45",
          class = "",
          shape = "rectangle",
          x = 109.666,
          y = 237.166,
          width = 31,
          height = 81.3333,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 200,
          name = "46",
          class = "",
          shape = "rectangle",
          x = 110.664,
          y = 287.337,
          width = 81,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 201,
          name = "47",
          class = "",
          shape = "rectangle",
          x = 333.023,
          y = 319.921,
          width = 31.0169,
          height = 88.3497,
          rotation = 270.476,
          visible = true,
          properties = {}
        },
        {
          id = 202,
          name = "48",
          class = "",
          shape = "rectangle",
          x = 390.398,
          y = 318.375,
          width = 88,
          height = 32,
          rotation = 270.476,
          visible = true,
          properties = {}
        },
        {
          id = 217,
          name = "19",
          class = "",
          shape = "rectangle",
          x = 351.192,
          y = 1965.55,
          width = 27.0065,
          height = 78.3398,
          rotation = 270.186,
          visible = true,
          properties = {}
        },
        {
          id = 227,
          name = "",
          class = "",
          shape = "rectangle",
          x = 176,
          y = 2832,
          width = 32,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 228,
          name = "",
          class = "",
          shape = "rectangle",
          x = 336,
          y = 2832,
          width = 32,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 229,
          name = "",
          class = "",
          shape = "rectangle",
          x = 336,
          y = 2880,
          width = 96,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 230,
          name = "",
          class = "",
          shape = "rectangle",
          x = 112,
          y = 2880,
          width = 96,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 237,
          name = "",
          class = "",
          shape = "rectangle",
          x = 96,
          y = 2576,
          width = 96,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 239,
          name = "",
          class = "",
          shape = "rectangle",
          x = 160,
          y = 2528,
          width = 32,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 248,
          name = "",
          class = "",
          shape = "rectangle",
          x = 352,
          y = 2576,
          width = 96,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 249,
          name = "",
          class = "",
          shape = "rectangle",
          x = 352,
          y = 2528,
          width = 32,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 260,
          name = "",
          class = "",
          shape = "rectangle",
          x = 419,
          y = 2192.5,
          width = 21,
          height = 31,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 294,
          name = "",
          class = "",
          shape = "rectangle",
          x = 206.5,
          y = 767.5,
          width = 11,
          height = 32.5,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 295,
          name = "",
          class = "",
          shape = "rectangle",
          x = 241,
          y = 621,
          width = 14.5,
          height = 31.5,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 296,
          name = "",
          class = "",
          shape = "rectangle",
          x = 319,
          y = 621,
          width = 15,
          height = 32.5,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 297,
          name = "",
          class = "",
          shape = "rectangle",
          x = 175,
          y = 287,
          width = 16.5,
          height = 32.5,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 298,
          name = "",
          class = "",
          shape = "rectangle",
          x = 333.5,
          y = 287,
          width = 18,
          height = 32.5,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 300,
          name = "",
          class = "",
          shape = "rectangle",
          x = 113,
          y = 1872.5,
          width = 33.5,
          height = 16.5,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 301,
          name = "",
          class = "",
          shape = "rectangle",
          x = 400,
          y = 1881,
          width = 30.5,
          height = 15,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 303,
          name = "",
          class = "",
          shape = "rectangle",
          x = 112.5,
          y = 1701,
          width = 32.5,
          height = 12.5,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 304,
          name = "",
          class = "",
          shape = "rectangle",
          x = 415,
          y = 1701.5,
          width = 33.5,
          height = 12,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 305,
          name = "",
          class = "",
          shape = "rectangle",
          x = 116,
          y = 1439,
          width = 33,
          height = 16.5,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 306,
          name = "",
          class = "",
          shape = "rectangle",
          x = 415.5,
          y = 1429.5,
          width = 32,
          height = 17,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 307,
          name = "",
          class = "",
          shape = "rectangle",
          x = 114.5,
          y = 1198.5,
          width = 31.5,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 309,
          name = "",
          class = "",
          shape = "rectangle",
          x = 416,
          y = 1188.5,
          width = 32,
          height = 13,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 310,
          name = "",
          class = "",
          shape = "rectangle",
          x = 129.5,
          y = 718.5,
          width = 31,
          height = 18.5,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 312,
          name = "",
          class = "",
          shape = "rectangle",
          x = 403.5,
          y = 709,
          width = 33.5,
          height = 18,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 313,
          name = "",
          class = "",
          shape = "rectangle",
          x = 109,
          y = 236.5,
          width = 32,
          height = 19,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 315,
          name = "",
          class = "",
          shape = "rectangle",
          x = 391,
          y = 230,
          width = 32,
          height = 20,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 17,
      name = "Camera",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 119,
          name = "1",
          class = "",
          shape = "point",
          x = 272,
          y = 2656,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 195,
          name = "2",
          class = "",
          shape = "point",
          x = 272,
          y = 2192,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 203,
          name = "3",
          class = "",
          shape = "point",
          x = 272,
          y = 1696,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 204,
          name = "4",
          class = "",
          shape = "point",
          x = 272,
          y = 1280,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 205,
          name = "5",
          class = "",
          shape = "point",
          x = 272,
          y = 800,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 206,
          name = "6",
          class = "",
          shape = "point",
          x = 272,
          y = 480,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    }
  }
}
