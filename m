Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from www3345.sakura.ne.jp ([49.212.235.55]:28661 "EHLO
        www3345.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750703AbdAWIee (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 23 Jan 2017 03:34:34 -0500
Message-ID: <5885B7AA.4030403@jinso.co.jp>
Date: Mon, 23 Jan 2017 16:58:34 +0900
From: Hiep Cao Minh <cm-hiep@jinso.co.jp>
MIME-Version: 1.0
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        DongCV <cv-dong@jinso.co.jp>
CC: Wolfram Sang <wsa@sang-engineering.com>,
        duclm <lm-duc@jinso.co.jp>,
        Ryusuke Sakato <ryusuke.sakato.bx@renesas.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        =?UTF-8?B?56iy5ZCJ?= <h-inayoshi@jinso.co.jp>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        =?UTF-8?B?RHVuZ++8muS6uuOCvQ==?= <nv-dung@jinso.co.jp>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        na-hoan@jinso.co.jp
Subject: Re: The failure summary report of GEN2 for linux stable v4.10-rc2
References: <1484558970996626000058af@nat.cybozu.com> <5001200.M7izD2cjP9@avalon> <53275dcd-a10d-a9b1-6354-04f146eb633f@jinso.co.jp> <2549854.ggP3E59vJ7@avalon>
In-Reply-To: <2549854.ggP3E59vJ7@avalon>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Laurent,

Thanks for your feedback.

> Dear Dong,
>
> On Friday 20 Jan 2017 12:11:50 DongCV wrote:
>> Dear Mr Laurent,
>>
>> Thank you for your quick reply.
>> This is the log file contains information about the command "modetest -M
>> rcar-du" (with the HDMI cable plugged).
> Thank you. I think I know what's wrong. The default mode picked by the system
> in your case uses positive H/V sync polarities, while in my cases the sync
> signals have negative polarities. Could you try to select 1024x768 @60Hz
> instead of 1024x768 @75Hz ? I think the HDMI output would then work correctly,
> which would confirm that the problem is indeed caused by sync polarities.
Dong is sick, so he did not attend today. He will reply to you tomorrow.
Could you explain more how to set 1024x768 @60Hz and negative polarities 
for the HDMI output?,

Thank you!.
Hiep.
