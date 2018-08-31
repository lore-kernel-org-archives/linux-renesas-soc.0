Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:46750 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727181AbeHaWGD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 31 Aug 2018 18:06:03 -0400
Reply-To: kieran.bingham@ideasonboard.com
To: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Salvator-XS-M3N SRU/HGT/COPY test fail
Message-ID: <b796e8fa-a2c2-9a9e-143b-df1002c2d4ea@ideasonboard.com>
Date: Fri, 31 Aug 2018 18:57:23 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Laurent,

I've had some interesting failures on the VSP1 tests on the M3-N board.

- vsp-unit-test-0015.sh
Testing SRU scaling from 1024x768 to 1024x768 in RGB24: fail
Testing SRU scaling from 1024x768 to 2048x1536 in RGB24: fail
Testing SRU scaling from 1024x768 to 1024x768 in YUV444M: fail
Testing SRU scaling from 1024x768 to 2048x1536 in YUV444M: fail

- vsp-unit-test-0023.sh
Testing histogram HGT with hue areas
0,255,255,255,255,255,255,255,255,255,255,255: fail
Testing histogram HGT with hue areas
0,40,40,80,80,120,120,160,160,200,200,255: fail
Testing histogram HGT with hue areas
220,40,40,80,80,120,120,160,160,200,200,220: fail
Testing histogram HGT with hue areas
0,10,50,60,100,110,150,160,200,210,250,255: fail
Testing histogram HGT with hue areas
10,20,50,60,100,110,150,160,200,210,230,240: fail
Testing histogram HGT with hue areas
240,20,60,80,100,120,140,160,180,200,210,220: fail
- vsp-unit-test-0025.sh
Testing copying 1024x768 in RGB24: fail
Testing copying 128x128 in RGB24: fail
Testing copying 128x1 in RGB24: diff: /tmp/frame-*.bin: No such file or
directory
mv: cannot stat '/tmp/frame-*.bin': No such file or directory
fail
Testing copying 1024x768 in ARGB32: fail
Testing copying 128x128 in ARGB32: fail
Testing copying 128x1 in ARGB32: diff: /tmp/frame-*.bin: No such file or
directory
mv: cannot stat '/tmp/frame-*.bin': No such file or directory
fail


The frames on test 15 are 'flipped' vertically, while on test 25, they
are rotated.

Please see the reference image and resulting output at:
https://ibb.co/fjPpkK
https://ibb.co/mfybXz

I'm sure I haven't seen this issue on the H3, so this could be an M3-N
specific issue.

Oddly, a later test (25, which I've posted earlier today) fails, because
the images are rotated 90* to the left ... So it seems like there is
certainly some uninitialised or confused state on the ROT bits somehow.

For reference, this is on my branch du/2018q3 on my rcar.git repo.
Commit 889e6d80c9f0eef433cfa1828c9a9d32a78479c2 which is based upon your
drm/du/next branch.


-- 
Regards
--
Kieran
