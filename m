Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:45523 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750892AbdARW0f (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 18 Jan 2017 17:26:35 -0500
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
Date: Thu, 19 Jan 2017 00:26:36 +0200
Message-ID: <1988000.69YelQnMiB@avalon>
In-Reply-To: <d7f4a948-37a2-e912-6e25-5690ad8ecef9@jinso.co.jp>
References: <1484558970996626000058af@nat.cybozu.com> <1541680.74X8BDbpjb@avalon> <d7f4a948-37a2-e912-6e25-5690ad8ecef9@jinso.co.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Dear Dong,

On Tuesday 17 Jan 2017 15:05:32 DongCV wrote:
> Dear Mr Laurent
> 
> Thank you for your quick reply.
> I've retested the HDMI output on Lager(H2) with v4.10-rc2.
> 
> The results:
> 
> Enabled CMA:
> 
> The HDMI cable unplugged: Could not recognize the display.
> The HDMI cable plugged: Recognized the display-> test fail.
> 
> The VGA cable unplugged: Recognized the display-> test fail.
> The VGA cable plugged: Recognized the display-> test fail.
> 
> 
> Disabled CMA: The same to the case of enabled CMA.
> 
> I attach the test procedures and test tool, test result.
> Please have a look at it.

I'm afraid there was a bit of misunderstanding. I was referring to the "Lager: 
Bad image quality when shown on HDMI display" issue, not the "DISPLAY-UNIT:  
Does not support 640x480 resolution" and "DISPLAY-UNIT: Does not support 16-
bit for color numbers" issues. I should have been more precise, I'm very sorry 
about that.

Could you please share your detailed test procedure, kernel configuration and 
test binaries for the "Lager: Bad image quality when shown on HDMI display" 
issue ?

-- 
Regards,

Laurent Pinchart
