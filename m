Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f48.google.com ([209.85.215.48]:33505 "EHLO
        mail-lf0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752291AbcIBMIT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Sep 2016 08:08:19 -0400
Received: by mail-lf0-f48.google.com with SMTP id b199so82350683lfe.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 02 Sep 2016 05:08:18 -0700 (PDT)
Subject: Re: [PATCH v3 12/12] arm64: dts: h3ulcb: Sound SSI support
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
References: <1472817881-11860-1-git-send-email-vladimir.barinov@cogentembedded.com>
 <1472817933-12018-1-git-send-email-vladimir.barinov@cogentembedded.com>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
From: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Message-ID: <813b2951-7270-b352-1d5e-b452cb502bbb@cogentembedded.com>
Date: Fri, 2 Sep 2016 15:08:14 +0300
MIME-Version: 1.0
In-Reply-To: <1472817933-12018-1-git-send-email-vladimir.barinov@cogentembedded.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 02.09.2016 15:05, Vladimir Barinov wrote:
> This supports SSI sound for H3ULCB board.
> SSI DMA mode used. CS2000 used as AUDIO_CLK_B.
>
> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
> Changes in version 3:
> - initially added
> Changes in version 4:
> - added comment for audio_clkout
>
>   arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts | 115 +++++++++++++++++++++++++
>   1 file changed, 115 insertions(+)
>
Sorry for the subject typo. The proper one is v4:
[PATCH v4 4/4] arm64: dts: h3ulcb: Sound SSI support
