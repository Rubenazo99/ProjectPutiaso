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
  nextobjectid = 301,
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
          x = 308,
          y = 2948,
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
          x = 212,
          y = 2948,
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
          y = 32,
          width = 48,
          height = 3168,
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
          id = 253,
          name = "",
          class = "",
          shape = "rectangle",
          x = 144,
          y = 2304,
          width = 16,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 254,
          name = "",
          class = "",
          shape = "rectangle",
          x = 384,
          y = 2304,
          width = 16,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 255,
          name = "",
          class = "",
          shape = "rectangle",
          x = 112,
          y = 2192,
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
          x = 416,
          y = 2192,
          width = 16,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 257,
          name = "",
          class = "",
          shape = "rectangle",
          x = 128,
          y = 2112,
          width = 16,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 258,
          name = "",
          class = "",
          shape = "rectangle",
          x = 400,
          y = 2112,
          width = 16,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 259,
          name = "",
          class = "",
          shape = "rectangle",
          x = 112,
          y = 1888,
          width = 32,
          height = 80,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 260,
          name = "",
          class = "",
          shape = "rectangle",
          x = 400,
          y = 1888,
          width = 32,
          height = 80,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 269,
          name = "",
          class = "",
          shape = "rectangle",
          x = 400,
          y = 1680,
          width = 32,
          height = 80,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 270,
          name = "",
          class = "",
          shape = "rectangle",
          x = 112,
          y = 1680,
          width = 32,
          height = 80,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 271,
          name = "",
          class = "",
          shape = "rectangle",
          x = 192,
          y = 1808,
          width = 16,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 272,
          name = "",
          class = "",
          shape = "rectangle",
          x = 336,
          y = 1808,
          width = 16,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 273,
          name = "",
          class = "",
          shape = "rectangle",
          x = 192,
          y = 1616,
          width = 16,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 274,
          name = "",
          class = "",
          shape = "rectangle",
          x = 336,
          y = 1616,
          width = 16,
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
          x = 112,
          y = 1408,
          width = 32,
          height = 80,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 281,
          name = "",
          class = "",
          shape = "rectangle",
          x = 400,
          y = 1408,
          width = 32,
          height = 80,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 282,
          name = "",
          class = "",
          shape = "rectangle",
          x = 192,
          y = 1312,
          width = 16,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 283,
          name = "",
          class = "",
          shape = "rectangle",
          x = 336,
          y = 1312,
          width = 16,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 288,
          name = "",
          class = "",
          shape = "rectangle",
          x = 112,
          y = 1168,
          width = 32,
          height = 80,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 289,
          name = "",
          class = "",
          shape = "rectangle",
          x = 400,
          y = 1168,
          width = 32,
          height = 80,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 299,
          name = "",
          class = "",
          shape = "rectangle",
          x = 112,
          y = 720,
          width = 32,
          height = 80,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 300,
          name = "",
          class = "",
          shape = "rectangle",
          x = 400,
          y = 720,
          width = 32,
          height = 80,
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
          x = 128,
          y = 2112,
          width = 288,
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
          x = 32,
          y = 2192,
          width = 96,
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
          x = 416,
          y = 2192,
          width = 96,
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
          width = 256,
          height = 32,
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
          width = 160,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 172,
          name = "27",
          class = "",
          shape = "rectangle",
          x = 192,
          y = 1616,
          width = 160,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 177,
          name = "32",
          class = "",
          shape = "rectangle",
          x = 192,
          y = 1312,
          width = 160,
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
          x = 32,
          y = 1040,
          width = 112,
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
          x = 192,
          y = 1040,
          width = 160,
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
          x = 400,
          y = 1040,
          width = 112,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 197,
          name = "44",
          class = "",
          shape = "rectangle",
          x = 224,
          y = 624,
          width = 112,
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
          id = 261,
          name = "",
          class = "",
          shape = "rectangle",
          x = 112,
          y = 1936,
          width = 80,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 262,
          name = "",
          class = "",
          shape = "rectangle",
          x = 112,
          y = 1888,
          width = 32,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 263,
          name = "",
          class = "",
          shape = "rectangle",
          x = 400,
          y = 1888,
          width = 32,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 264,
          name = "",
          class = "",
          shape = "rectangle",
          x = 352,
          y = 1936,
          width = 80,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 265,
          name = "",
          class = "",
          shape = "rectangle",
          x = 112,
          y = 1728,
          width = 80,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 266,
          name = "",
          class = "",
          shape = "rectangle",
          x = 112,
          y = 1680,
          width = 32,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 267,
          name = "",
          class = "",
          shape = "rectangle",
          x = 352,
          y = 1728,
          width = 80,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 268,
          name = "",
          class = "",
          shape = "rectangle",
          x = 400,
          y = 1680,
          width = 32,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 275,
          name = "",
          class = "",
          shape = "rectangle",
          x = 352,
          y = 1456,
          width = 80,
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
          x = 400,
          y = 1408,
          width = 32,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 277,
          name = "",
          class = "",
          shape = "rectangle",
          x = 112,
          y = 1456,
          width = 80,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 278,
          name = "",
          class = "",
          shape = "rectangle",
          x = 112,
          y = 1408,
          width = 32,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 284,
          name = "",
          class = "",
          shape = "rectangle",
          x = 352,
          y = 1216,
          width = 80,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 285,
          name = "",
          class = "",
          shape = "rectangle",
          x = 400,
          y = 1168,
          width = 32,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 286,
          name = "",
          class = "",
          shape = "rectangle",
          x = 112,
          y = 1216,
          width = 80,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 287,
          name = "",
          class = "",
          shape = "rectangle",
          x = 112,
          y = 1168,
          width = 32,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 290,
          name = "",
          class = "",
          shape = "rectangle",
          x = 128,
          y = 1040,
          width = 16,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 291,
          name = "",
          class = "",
          shape = "rectangle",
          x = 192,
          y = 1040,
          width = 16,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 292,
          name = "",
          class = "",
          shape = "rectangle",
          x = 336,
          y = 1040,
          width = 16,
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
          x = 400,
          y = 1040,
          width = 16,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 294,
          name = "",
          class = "",
          shape = "rectangle",
          x = 352,
          y = 768,
          width = 80,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 295,
          name = "",
          class = "",
          shape = "rectangle",
          x = 400,
          y = 720,
          width = 32,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 297,
          name = "",
          class = "",
          shape = "rectangle",
          x = 112,
          y = 720,
          width = 32,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 298,
          name = "",
          class = "",
          shape = "rectangle",
          x = 112,
          y = 768,
          width = 80,
          height = 32,
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
