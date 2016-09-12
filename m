Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f44.google.com ([209.85.215.44]:35865 "EHLO
        mail-lf0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932565AbcILRwp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 12 Sep 2016 13:52:45 -0400
Received: by mail-lf0-f44.google.com with SMTP id g62so93079078lfe.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Sep 2016 10:52:44 -0700 (PDT)
Subject: Re: [PATCH] ARM: dts: wheat: add DU support
To: horms@verge.net.au, linux-renesas-soc@vger.kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.com,
        devicetree@vger.kernel.org
References: <34968644.DhifNderY8@wasted.cogentembedded.com>
 <15676050.WJW1jK1n2R@wasted.cogentembedded.com>
Cc: magnus.damm@gmail.com, linux@arm.linux.org.uk,
        linux-arm-kernel@lists.infradead.org
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <ba5b2f8e-13f8-6c7d-17c1-44988d30a947@cogentembedded.com>
Date: Mon, 12 Sep 2016 20:52:40 +0300
MIME-Version: 1.0
In-Reply-To: <15676050.WJW1jK1n2R@wasted.cogentembedded.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 09/02/2016 12:29 AM, Sergei Shtylyov wrote:

> Define  the  Wheat board dependent  part of the DU device node.
> Add the device nodes for the Analog Devices ADV7513 HDMI transmitters
> connected to DU0/1.  Add the necessary subnodes to interconnect DU with
> HDMI transmitters/connectors.
>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>
> ---
> This patch is against the 'renesas-devel-20160901-v4.8-rc4' of Simon Horman's
> 'renesas.git' repo plus the Wheat CAN and SDHI patches posted earlier...
> The path depends on the 2 DRM patches just posted in order to work correctly!

    In principle, both these patches have been queued by the maintainers... 
Simon, are you going to wait till they hit media_tree.git? Linus' tree?

MBR, Sergei
