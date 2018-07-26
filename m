Return-Path: <linux-media-owner@vger.kernel.org>
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
To: Lars-Peter Clausen <lars@metafoo.de>,
        Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        Steve Longerbeam <steve_longerbeam@mentor.com>
Cc: linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2 0/2] adv7180: fix format and frame interval
Date: Thu, 26 Jul 2018 12:27:14 +0200
Message-Id: <20180726102716.1390-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi,

These first patch fix a issue which was discussed back in 2016 that the
field format of the adv7180 should be V4L2_FIELD_ALTERNATE. While the
second patch adds support for the g_frame_interval video op.

Work is loosely based on work by Steve Longerbeam posted in 2016. I have
talked to Steven and he have agreed to me taking over the patches as he
did not intend to continue his work on the original series.

The series is based on the latest media-tree and tested on Renesas
Koelsch board.

Niklas Söderlund (2):
  adv7180: fix field type to V4L2_FIELD_ALTERNATE
  adv7180: add g_frame_interval support

 drivers/media/i2c/adv7180.c | 30 +++++++++++++++++++++++++-----
 1 file changed, 25 insertions(+), 5 deletions(-)

-- 
2.18.0
