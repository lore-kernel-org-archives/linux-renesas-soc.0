Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f46.google.com ([209.85.215.46]:33689 "EHLO
        mail-lf0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1758980AbcIPKyc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Sep 2016 06:54:32 -0400
Received: by mail-lf0-f46.google.com with SMTP id h127so63349126lfh.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 16 Sep 2016 03:54:31 -0700 (PDT)
Subject: Re: [PATCH 4/4] ARM: dts: rskrza1: add mmc DT support
To: Chris Brandt <chris.brandt@renesas.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Simon Horman <horms+renesas@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
References: <20160915193405.26943-1-chris.brandt@renesas.com>
 <20160915193405.26943-5-chris.brandt@renesas.com>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <f719fb03-fa82-62a9-ca81-7dab050ee503@cogentembedded.com>
Date: Fri, 16 Sep 2016 13:54:23 +0300
MIME-Version: 1.0
In-Reply-To: <20160915193405.26943-5-chris.brandt@renesas.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 9/15/2016 10:34 PM, Chris Brandt wrote:

> Since the MMC and SDHI1 on the RSK share the same socket connector (CN1),
> you cannot enabled MMC and SDHI1 at the same time. Therefore the status

    Enable.

> has been set to disabled because SDHI is more popular with this board.
> However, keeping this code in here serves as a good way to document how
> the MMC on the RZ/A1 has been known to work for someone that does want
> to use MMC instead of SDHI1.
>
> A fixed 3.3 regulator is included because it is required by the mmc
> driver.
>
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
[...]

MBR, Sergei
