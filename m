Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:59703 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752020AbdATMfl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 20 Jan 2017 07:35:41 -0500
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
Date: Fri, 20 Jan 2017 14:36:01 +0200
Message-ID: <2549854.ggP3E59vJ7@avalon>
In-Reply-To: <53275dcd-a10d-a9b1-6354-04f146eb633f@jinso.co.jp>
References: <1484558970996626000058af@nat.cybozu.com> <5001200.M7izD2cjP9@avalon> <53275dcd-a10d-a9b1-6354-04f146eb633f@jinso.co.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Dear Dong,

On Friday 20 Jan 2017 12:11:50 DongCV wrote:
> Dear Mr Laurent,
> 
> Thank you for your quick reply.
> This is the log file contains information about the command "modetest -M
> rcar-du" (with the HDMI cable plugged).

Thank you. I think I know what's wrong. The default mode picked by the system 
in your case uses positive H/V sync polarities, while in my cases the sync 
signals have negative polarities. Could you try to select 1024x768 @60Hz 
instead of 1024x768 @75Hz ? I think the HDMI output would then work correctly, 
which would confirm that the problem is indeed caused by sync polarities.

I don't know why positive sync polarities are broken on Lager. I'll try to 
investigate that, but it will have to wait for two weeks as I'll be travelling 
until the 6th of February without access to my Lager board.

-- 
Regards,

Laurent Pinchart
