Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:55733 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752915AbdASXsw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 19 Jan 2017 18:48:52 -0500
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: DongCV <cv-dong@jinso.co.jp>
Cc: Wolfram Sang <wsa@sang-engineering.com>,
        duclm <lm-duc@jinso.co.jp>,
        Ryusuke Sakato <ryusuke.sakato.bx@renesas.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        =?utf-8?B?56iy5ZCJ?= <h-inayoshi@jinso.co.jp>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        =?utf-8?B?RHVuZ++8muS6uuOCvQ==?= <nv-dung@jinso.co.jp>,
        Cao Minh Hiep <cm-hiep@jinso.co.jp>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        na-hoan@jinso.co.jp
Subject: Re: The failure summary report of GEN2 for linux stable v4.10-rc2
Date: Fri, 20 Jan 2017 01:49:11 +0200
Message-ID: <5001200.M7izD2cjP9@avalon>
In-Reply-To: <8a056d37-3de9-30ac-74bc-e1393d1b193a@jinso.co.jp>
References: <1484558970996626000058af@nat.cybozu.com> <1988000.69YelQnMiB@avalon> <8a056d37-3de9-30ac-74bc-e1393d1b193a@jinso.co.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Dear Dong,

On Thursday 19 Jan 2017 18:14:45 DongCV wrote:
> Dear Mr Laurent
> 
> I apologize for the misunderstanding.

No worries, I should have been more precise.

> I've retested the HDMI output on Lager(H2) with v4.10-rc2.
> 
> The results:
> 
> Enabled CMA:
> 
> The HDMI cable unplugged: Could not recognize the display.
> The HDMI cable plugged: Recognized the display-> test fail.
> 
> The VGA cable unplugged: Recognized the display-> test ok.
> The VGA cable plugged: Recognized the display-> test ok.
> 
> 
> Disabled CMA: The same to the case of enabled CMA.
> 
> I attach the test procedures and test tool, test result.
> Please have a look at it.

I've followed the same test procedure:

- Check out kernel v4.10-rc2
- Compile the kernel with the CONFIG_CMA_ENABLE.txt you have provided
- Disconnect the VGA and HDMI cables
- Turn the power on to the Lager board, let it boot
- Plug the HDMI cable
- Run 'bmap /dev/fb0 hdmi.bmp' with the hdmi.bmp file you have provided

The output on the display is fine, identical to your 'VGA_Image.jpg' picture.

At this point I believe the key difference between our setups is the HDMI 
monitor. Could you please send me the output of

modetest -M rcar-du

with the HDMI cable plugged ?

-- 
Regards,

Laurent Pinchart
