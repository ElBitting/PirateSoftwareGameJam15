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
  nextlayerid = 15,
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
      data = "eJztlkEOgjAQRcvKtWvjwj0brqeeQD2Bei9xASzUKBDv4JBM42TSTkVtIcpPXmgKM6+QhlSpIX1MFNA1RpKO/HoNGZADBfHHAf0n4Axc0B//uT90TH7f65gDC2Ap+N9ZwwxxOVfAGti84Lf1c/l5HXVugR2wZ/5UeI8D3k9xzOdSg7+ZS/BKnblAQfpoMkcNr1OOuuZ9rxZuBr/+RhKXlnWSP2J9SqBC7gQ6Vxv8Jauhz1cWavXcf9J+puHeNnvWlEhA8n8ayev6H4TwtyFEunT/ao6WcaiMGK5nhnzvO/Stj6/Qs5COzzUnyn7+8u3W/W3nr+be1DMT5nwAw46GIA=="
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
          id = 52,
          name = "Vine1",
          type = "",
          shape = "rectangle",
          x = 160.612,
          y = 32.8229,
          width = 6,
          height = 15,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 53,
          name = "Vine1",
          type = "",
          shape = "rectangle",
          x = 160.634,
          y = 48.8159,
          width = 6.08696,
          height = 15.0444,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 54,
          name = "Vine1",
          type = "",
          shape = "rectangle",
          x = 160.7,
          y = 64.8229,
          width = 6,
          height = 15.0222,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 55,
          name = "Vine1",
          type = "",
          shape = "rectangle",
          x = 160.7,
          y = 80.8449,
          width = 5.99807,
          height = 14.9778,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 56,
          name = "Vine1",
          type = "",
          shape = "rectangle",
          x = 160.656,
          y = 96.8989,
          width = 6.04348,
          height = 14.875,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 57,
          name = "Vine1",
          type = "",
          shape = "rectangle",
          x = 162.449,
          y = 29.5729,
          width = 2.625,
          height = 2,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 58,
          name = "Vine1",
          type = "",
          shape = "rectangle",
          x = 160.677,
          y = 112.698,
          width = 6.04348,
          height = 15.0625,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 59,
          name = "Vine1",
          type = "",
          shape = "rectangle",
          x = 160.72,
          y = 128.521,
          width = 5.99807,
          height = 14.9778,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 60,
          name = "Vine1",
          type = "",
          shape = "rectangle",
          x = 160.676,
          y = 144.575,
          width = 6.04348,
          height = 14.875,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 61,
          name = "Vine1",
          type = "",
          shape = "rectangle",
          x = 160.697,
          y = 160.374,
          width = 6.04348,
          height = 15.0625,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 14,
      name = "entity",
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
          id = 45,
          name = "Apple",
          type = "apple",
          shape = "ellipse",
          x = 228.239,
          y = 196.335,
          width = 8.18182,
          height = 8.54545,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 48,
          name = "Apple",
          type = "apple",
          shape = "ellipse",
          x = 307.784,
          y = 196.063,
          width = 8.18182,
          height = 8.54545,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 49,
          name = "Apple",
          type = "apple",
          shape = "ellipse",
          x = 20.5758,
          y = 135.394,
          width = 8.18182,
          height = 8.54545,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 50,
          name = "Apple",
          type = "apple",
          shape = "ellipse",
          x = 142.242,
          y = 314.727,
          width = 8.18182,
          height = 8.54545,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 51,
          name = "Apple",
          type = "apple",
          shape = "ellipse",
          x = 452.576,
          y = 499.394,
          width = 8.18182,
          height = 8.54545,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    }
  }
}
