return {
  version = "1.10",
  luaversion = "5.1",
  tiledversion = "1.11.0",
  class = "",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 32,
  height = 32,
  tilewidth = 16,
  tileheight = 16,
  nextlayerid = 14,
  nextobjectid = 62,
  properties = {},
  tilesets = {
    {
      name = "16x16 dungeon tiles",
      firstgid = 1,
      class = "",
      tilewidth = 16,
      tileheight = 16,
      spacing = 0,
      margin = 0,
      columns = 16,
      image = "../Tileset/16x16 dungeon tiles.png",
      imagewidth = 256,
      imageheight = 208,
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
      tilecount = 208,
      tiles = {}
    },
    {
      name = "Tileset",
      firstgid = 209,
      class = "",
      tilewidth = 16,
      tileheight = 16,
      spacing = 0,
      margin = 0,
      columns = 6,
      image = "../../Sprites/Tileset.png",
      imagewidth = 100,
      imageheight = 100,
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
      tilecount = 36,
      tiles = {}
    },
    {
      name = "potSpriteSheet",
      firstgid = 245,
      class = "",
      tilewidth = 32,
      tileheight = 32,
      spacing = 0,
      margin = 0,
      columns = 4,
      image = "../../Sprites/potSpriteSheet.png",
      imagewidth = 128,
      imageheight = 32,
      objectalignment = "unspecified",
      tilerendersize = "tile",
      fillmode = "stretch",
      tileoffset = {
        x = 0,
        y = 0
      },
      grid = {
        orientation = "orthogonal",
        width = 32,
        height = 32
      },
      properties = {},
      wangsets = {},
      tilecount = 4,
      tiles = {
        {
          id = 0,
          animation = {
            {
              tileid = 0,
              duration = 250
            },
            {
              tileid = 1,
              duration = 250
            },
            {
              tileid = 2,
              duration = 250
            },
            {
              tileid = 3,
              duration = 250
            }
          }
        }
      }
    }
  },
  layers = {
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 32,
      height = 32,
      id = 1,
      name = "BG",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      encoding = "base64",
      compression = "zlib",
      data = "eJztwwEJAAAMBKHr3+4brcdQcNVUVVXV1w8gWEQu"
    },
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 32,
      height = 32,
      id = 2,
      name = "FG",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      encoding = "base64",
      compression = "zlib",
      data = "eJztlkEOgjAQRduVa9fGhXs2XE89gXoC9V7iAlgoUSDcwSFp42TSTkVtIcpPXkJaZl5LGlIhxgwxMqBrqoh78us1pEAG5MgfBfRfgCtQKH/05/7QMfl9r2MJrIA1439nDQuFy7kBtsDuBb+tn8tP67BzDxyAI/EnzD5Oaj5Rz3osRuPUn6B57MwYctRHkzpqaJ1w1LX7vVm4G/z6G3EUHes4vyR9SqBSNAg8Vhv8JanB71cWavE8f9x5xqHeLmfWFMnA+T8N53X9D0L4uxAifbp/NWfLc6hMCK53xnzvOwytj6/gu5COzzXHwn7/8u3W/W33r3Zu7pkZcT4AbsiFeQ=="
    },
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 32,
      height = 32,
      id = 10,
      name = "fg2",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      encoding = "base64",
      compression = "zlib",
      data = "eJzt1sEJACAIQFFHb8iCrGUq7CANYFD/gaSnf00EMNVNtCKS8py1Z7tD9dluu9/spk//+b5e6OvxAgAA/OTGX8g3B4IAK7A="
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 8,
      name = "Ladders",
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
          id = 26,
          name = "",
          type = "",
          shape = "rectangle",
          x = 45.75,
          y = 79.9688,
          width = 2,
          height = 128.063,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 28,
          name = "",
          type = "",
          shape = "rectangle",
          x = 96.025,
          y = 80.0241,
          width = 4.75,
          height = 128.063,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 3,
      name = "Walls",
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
          id = 8,
          name = "",
          type = "",
          shape = "rectangle",
          x = 64,
          y = 480,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 10,
          name = "",
          type = "",
          shape = "rectangle",
          x = 80,
          y = 464,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 11,
          name = "",
          type = "",
          shape = "rectangle",
          x = 96,
          y = 432,
          width = 16,
          height = 9.5,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 12,
          name = "",
          type = "",
          shape = "rectangle",
          x = 112,
          y = 384,
          width = 64,
          height = 8.54545,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 13,
          name = "",
          type = "",
          shape = "rectangle",
          x = 256,
          y = 384,
          width = 48,
          height = 8.72727,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 14,
          name = "",
          type = "",
          shape = "rectangle",
          x = 320,
          y = 416,
          width = 16,
          height = 8.72727,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 15,
          name = "",
          type = "",
          shape = "rectangle",
          x = 384,
          y = 432,
          width = 16,
          height = 9.09091,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 16,
          name = "",
          type = "",
          shape = "rectangle",
          x = 448,
          y = 480,
          width = 16,
          height = 8.90909,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 17,
          name = "",
          type = "",
          shape = "rectangle",
          x = 48,
          y = 496,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 18,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 512,
          width = 512,
          height = 16,
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
      name = "ThickWalls",
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
          id = 29,
          name = "",
          type = "",
          shape = "rectangle",
          x = 48,
          y = 80,
          width = 48,
          height = 128,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 30,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 208,
          width = 128,
          height = 64,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 31,
          name = "",
          type = "",
          shape = "rectangle",
          x = 192,
          y = 208,
          width = 160,
          height = 48,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 32,
          name = "",
          type = "",
          shape = "rectangle",
          x = 416,
          y = 208,
          width = 96,
          height = 48,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 13,
      name = "Entities",
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
          id = 51,
          name = "Apple",
          type = "Apple",
          shape = "ellipse",
          x = 222.667,
          y = 188.485,
          width = 14.6667,
          height = 14.6667,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 53,
          name = "Apple",
          type = "Apple",
          shape = "ellipse",
          x = 320.364,
          y = 189.091,
          width = 14.6667,
          height = 14.6667,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 54,
          name = "Apple",
          type = "Apple",
          shape = "ellipse",
          x = 17.6666,
          y = 141.667,
          width = 14.6667,
          height = 14.6667,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 55,
          name = "Apple",
          type = "Apple",
          shape = "ellipse",
          x = 137,
          y = 361.667,
          width = 14.6667,
          height = 14.6667,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 56,
          name = "Apple",
          type = "Apple",
          shape = "ellipse",
          x = 449,
          y = 496,
          width = 14.6667,
          height = 14.6667,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 60,
          name = "Cauldron",
          type = "Cauldron",
          shape = "rectangle",
          x = 64,
          y = 48,
          width = 32,
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
      id = 4,
      name = "Hazards",
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
          id = 19,
          name = "",
          type = "",
          shape = "rectangle",
          x = 64,
          y = 502.5,
          width = 381.75,
          height = 9.5,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 5,
      name = "TeleDoor",
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
          id = 22,
          name = "",
          type = "",
          shape = "rectangle",
          x = 480,
          y = 507.636,
          width = 16,
          height = 4.36364,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 7,
      name = "FinalDoor",
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
          id = 24,
          name = "",
          type = "",
          shape = "rectangle",
          x = 16,
          y = 201.5,
          width = 16,
          height = 6.5,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 12,
      name = "Vines",
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
          id = 33,
          name = "Vine2",
          type = "",
          shape = "rectangle",
          x = 388.913,
          y = 113,
          width = 6,
          height = 15,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 34,
          name = "Vine2",
          type = "",
          shape = "rectangle",
          x = 388.935,
          y = 128.993,
          width = 6.08696,
          height = 15.0444,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 35,
          name = "Vine2",
          type = "",
          shape = "rectangle",
          x = 389.001,
          y = 145,
          width = 6,
          height = 15.0222,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 37,
          name = "Vine2",
          type = "",
          shape = "rectangle",
          x = 389.001,
          y = 161.022,
          width = 5.99807,
          height = 14.9778,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 38,
          name = "Vine2",
          type = "",
          shape = "rectangle",
          x = 388.957,
          y = 177.076,
          width = 6.04348,
          height = 14.875,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 39,
          name = "Vine2",
          type = "",
          shape = "rectangle",
          x = 390.75,
          y = 109.75,
          width = 2.625,
          height = 2,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 40,
          name = "Vine2",
          type = "",
          shape = "rectangle",
          x = 388.978,
          y = 192.875,
          width = 6.04348,
          height = 15.0625,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 41,
          name = "Vine1",
          type = "",
          shape = "rectangle",
          x = 161.946,
          y = 71.6563,
          width = 6,
          height = 15,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 42,
          name = "Vine1",
          type = "",
          shape = "rectangle",
          x = 161.968,
          y = 87.6492,
          width = 6.08696,
          height = 15.0444,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 43,
          name = "Vine1",
          type = "",
          shape = "rectangle",
          x = 162.034,
          y = 103.656,
          width = 6,
          height = 15.0222,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 44,
          name = "Vine1",
          type = "",
          shape = "rectangle",
          x = 162.034,
          y = 119.678,
          width = 5.99807,
          height = 14.9778,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 45,
          name = "Vine1",
          type = "",
          shape = "rectangle",
          x = 161.99,
          y = 135.732,
          width = 6.04348,
          height = 14.875,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 46,
          name = "Vine1",
          type = "",
          shape = "rectangle",
          x = 163.783,
          y = 68.4063,
          width = 2.625,
          height = 2,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 47,
          name = "Vine1",
          type = "",
          shape = "rectangle",
          x = 162.011,
          y = 151.531,
          width = 6.04348,
          height = 15.0625,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 48,
          name = "Vine1",
          type = "",
          shape = "rectangle",
          x = 162.012,
          y = 167.792,
          width = 5.99807,
          height = 14.9778,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 49,
          name = "Vine1",
          type = "",
          shape = "rectangle",
          x = 161.968,
          y = 183.846,
          width = 6.04348,
          height = 14.875,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 50,
          name = "Vine1",
          type = "",
          shape = "rectangle",
          x = 161.989,
          y = 199.645,
          width = 6.04348,
          height = 15.0625,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    }
  }
}
