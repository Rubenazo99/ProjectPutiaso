return {
  version = "1.9",
  luaversion = "5.1",
  tiledversion = "1.9.2",
  class = "",
  orientation = "orthogonal",
  renderorder = "left-up",
  width = 34,
  height = 60,
  tilewidth = 16,
  tileheight = 16,
  nextlayerid = 16,
  nextobjectid = 112,
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
          x = 420,
          y = 756,
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
          x = 100,
          y = 756,
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
          id = 97,
          name = "4",
          class = "",
          shape = "rectangle",
          x = 96,
          y = 640,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 98,
          name = "3",
          class = "",
          shape = "rectangle",
          x = 416,
          y = 640,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 94,
          name = "2",
          class = "",
          shape = "rectangle",
          x = -16,
          y = 16,
          width = 48,
          height = 1184,
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
          y = 16,
          width = 48,
          height = 1184,
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
          x = 96,
          y = 640,
          width = 352,
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
          y = 800,
          width = 544,
          height = 48,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    }
  }
}
