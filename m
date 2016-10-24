Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from www1246.sakura.ne.jp ([219.94.162.56]:48683 "EHLO
        www1246.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750849AbcJXFvd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 24 Oct 2016 01:51:33 -0400
From: Xuan Truong Nguyen <nx-truong@jinso.co.jp>
Subject: Re: The failure summary report of GEN2 for linux stable v4.8
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <57A46D20.7040106@jinso.co.jp> <1557504.I3EyWl6QE0@avalon>
 <a101cec4-c9ee-48fa-4f16-5e4cb2b8fab7@jinso.co.jp>
 <5754513.jIbGsJMV7d@avalon>
Cc: duclm <lm-duc@jinso.co.jp>, ryusuke.sakato.bx@renesas.com,
        kuninori.morimoto.gx@renesas.com, magnus.damm@gmail.com,
        geert+renesas@glider.be, h-inayoshi@jinso.co.jp,
        yoshihiro.shimoda.uh@renesas.com, nv-dung@jinso.co.jp,
        cm-hiep@jinso.co.jp, laurent.pinchart+renesas@ideasonboard.com,
        horms+renesas@verge.net.au, linux-renesas-soc@vger.kernel.org,
        wsa@sang-engineering.com
Message-ID: <50d78e81-1e89-c34f-4dcb-c128902b2e1a@jinso.co.jp>
Date: Mon, 24 Oct 2016 14:51:28 +0900
MIME-Version: 1.0
In-Reply-To: <5754513.jIbGsJMV7d@avalon>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi laurent.

> Could you please tell me what you're using to test the display ?
Sorry if I misunderstand what you wanted to know.
I'm using the LG 23MP48HQ-P and VIERA TH-L19C3-P - Panasonic (White)
http://www.lg.com/ca_en/desktop-monitors/lg-23MP48HQ-P
http://panasonic.jp/viera/p-db/TH-L19C3.html

I tested using the command:  bmap /dev/fb0 picture.bmp
on M2 board (Koelsch) the image is displayed clearly.
but on H2 board (Lager) the image is displayed not clearly.

I also retested on V4.9-rc2 and something weird happened.
for VIERA TH-L19C3-P:
- if I boot the board before inserting the cable, the display is not 
working.
- but if I inserted the cable before booting, it works, but the image is 
not displayed clearly.

for LG 23MP48HQ-P:
- if I boot the board before inserting the cable, the driver probes 
successfully.
but after inserting the cable, the display almost does not work (no signal).
- if I boot the board with the cable inserted in advance, the driver 
fails on probe.
I checked with dmesg:
root@linaro-nano:~# dmesg | grep rcar-du
[    5.749231] rcar-du feb00000.display: failed to allocate buffer with 
size 8294400
[    5.771675] rcar-du feb00000.display: Failed to set initial hw 
configuration.
[    5.793075] rcar-du fdmesg | grep rcar-dueb00000.display: failed to 
initialize DRM/KMS (-12)
[    5.813564] rcar-du: probe of feb00000.display failed with error -12
root@linaro-nano:~#

The cables are ok, two screens work normally on Ubuntu.

thanks and best regards
JINSO/Truong
