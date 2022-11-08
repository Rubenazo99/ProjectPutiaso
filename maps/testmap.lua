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
  nextobjectid = 211,
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
          x = 310,
          y = 2999,
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
          x = 371,
          y = 2847,
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
          height = 3440.67,
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
          height = 3438.67,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 208,
          name = "3",
          class = "",
          shape = "rectangle",
          x = 330,
          y = 2827.16,
          width = 36,
          height = 83.67,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 209,
          name = "4",
          class = "",
          shape = "rectangle",
          x = 177,
          y = 2827.16,
          width = 36,
          height = 83.67,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 210,
          name = "5",
          class = "",
          shape = "rectangle",
          x = 162,
          y = 2523.16,
          width = 36,
          height = 83.67,
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
          id = 101,
          name = "2",
          class = "",
          shape = "rectangle",
          x = 111.667,
          y = 2880,
          width = 92,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
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
          x = 34.6667,
          y = 2720,
          width = 64,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 149,
          name = "5",
          class = "",
          shape = "rectangle",
          x = 97.3333,
          y = 2574.67,
          width = 88,
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
          x = 34,
          y = 2402,
          width = 61.3333,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 153,
          name = "8",
          class = "",
          shape = "rectangle",
          x = 340,
          y = 2878.34,
          width = 95,
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
          x = 445.333,
          y = 2720,
          width = 64,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 156,
          name = "11",
          class = "",
          shape = "rectangle",
          x = 358.667,
          y = 2575.33,
          width = 88,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 157,
          name = "12",
          class = "",
          shape = "rectangle",
          x = 353.999,
          y = 2526,
          width = 31,
          height = 81.3333,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 158,
          name = "13",
          class = "",
          shape = "rectangle",
          x = 447.333,
          y = 2398.67,
          width = 66,
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
          x = 191,
          y = 2112,
          width = 158,
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
          x = 34,
          y = 2190,
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
          x = 147,
          y = 2302,
          width = 268,
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
          x = 102.334,
          y = 2012.66,
          width = 88,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 164,
          name = "19",
          class = "",
          shape = "rectangle",
          x = 104.666,
          y = 1963.33,
          width = 31,
          height = 81.3333,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 165,
          name = "20",
          class = "",
          shape = "rectangle",
          x = 404.086,
          y = 2046.78,
          width = 88,
          height = 32,
          rotation = 270.793,
          visible = true,
          properties = {}
        },
        {
          id = 166,
          name = "21",
          class = "",
          shape = "rectangle",
          x = 351.793,
          y = 2047.73,
          width = 32.0006,
          height = 84.2361,
          rotation = 270.793,
          visible = true,
          properties = {}
        },
        {
          id = 167,
          name = "22",
          class = "",
          shape = "rectangle",
          x = 194,
          y = 1840,
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
          x = 110.334,
          y = 1757.66,
          width = 80,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 169,
          name = "24",
          class = "",
          shape = "rectangle",
          x = 111.666,
          y = 1708.33,
          width = 32,
          height = 81.3333,
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
          y = 1785.68,
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
          y = 1630,
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
          y = 1515.67,
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
          x = 113.002,
          y = 1193.83,
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
          y = 1275.17,
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
          y = 715.333,
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
          x = 131.499,
          y = 763.503,
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
          x = 399.233,
          y = 795.541,
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
          x = 387.398,
          y = 321.375,
          width = 88,
          height = 32,
          rotation = 270.476,
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
          x = 264.667,
          y = 2660,
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
          x = 259,
          y = 2185,
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
          x = 280,
          y = 1705,
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
          x = 286,
          y = 1279,
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
          x = 285,
          y = 796,
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
          x = 288,
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
