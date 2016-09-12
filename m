Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from www1246.sakura.ne.jp ([219.94.162.56]:33415 "EHLO
        www1246.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753632AbcILA0v (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 11 Sep 2016 20:26:51 -0400
Subject: Re: [PATCH 7/8] clocksource: Kconfig: Modify CMT config support 64bit
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <1473421394-9745-1-git-send-email-bd-phuc@jinso.co.jp>
 <1473421394-9745-8-git-send-email-bd-phuc@jinso.co.jp>
 <4193048.IXigyaYqrQ@avalon>
Cc: daniel.lezcano@linaro.org, tglx@linutronix.de,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sh@vger.kernel.org, geert+renesas@glider.be,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@vger.kernel.org,
        laurent.pinchart+renesas@ideasonboard.com, magnus.damm@gmail.com,
        horms@verge.net.au, kuninori.morimoto.gx@renesas.com,
        yoshihiro.shimoda.uh@renesas.com, ryusuke.sakato.bx@renesas.com,
        h-inayoshi@jinso.co.jp, cm-hiep@jinso.co.jp, nv-dung@jinso.co.jp
From: Bui Duc Phuc <bd-phuc@jinso.co.jp>
Message-ID: <6c81d16a-85de-f49f-af66-7d80f1aa3eb4@jinso.co.jp>
Date: Mon, 12 Sep 2016 09:25:52 +0900
MIME-Version: 1.0
In-Reply-To: <4193048.IXigyaYqrQ@avalon>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Laurent

Thank you for your comments.
> I think you should instead add
>
> 	select SH_TIMER_CMT
>
> to the config ARCH_RENESAS section in arch/arm64/Kconfig.platforms
I will update in V2.

-- 
Regards,

Bui Duc Phuc
