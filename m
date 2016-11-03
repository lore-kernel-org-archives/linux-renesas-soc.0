Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f41.google.com ([209.85.215.41]:36421 "EHLO
        mail-lf0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756792AbcKCQ5r (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Nov 2016 12:57:47 -0400
Received: by mail-lf0-f41.google.com with SMTP id t196so44529647lff.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 03 Nov 2016 09:57:46 -0700 (PDT)
Subject: Re: [PATCH] ARM: DTS: r8a7794: alt: Fix PCF names for DU
To: Jacopo Mondi <jacopo@jmondi.org>, horms@verge.net.au,
        magnus.damm@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com,
        linux@armlinux.org.uk
References: <1478180574-15464-1-git-send-email-jacopo@jmondi.org>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <085d178c-b0fb-ed42-79ce-590507baeba7@cogentembedded.com>
Date: Thu, 3 Nov 2016 19:57:43 +0300
MIME-Version: 1.0
In-Reply-To: <1478180574-15464-1-git-send-email-jacopo@jmondi.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello.

On 11/03/2016 04:42 PM, Jacopo Mondi wrote:

> Update the PCF pin groups and function names of DU interface for

    PFC maybe?

> r8a7794 ALT board.
>
> The currently specified pin groups and function names prevented PCF and
> DU interfaces from being correctly configured:
>
> sh-pfc e6060000.pin-controller: function 'du' not supported
> sh-pfc e6060000.pin-controller: invalid function du in map table
> sh-pfc e6060000.pin-controller: function 'du' not supported
> sh-pfc e6060000.pin-controller: invalid function du in map table
> sh-pfc e6060000.pin-controller: function 'du' not supported
> sh-pfc e6060000.pin-controller: invalid function du in map table
> sh-pfc e6060000.pin-controller: function 'du' not supported
> sh-pfc e6060000.pin-controller: invalid function du in map table
> rcar-du: probe of feb00000.display failed with error -22
>
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>
> Patch applied against Simon Horman's renesas/master branch.
> The PCF pin groups and function renaming was introduced by commit 56ed4bb9 and
> DTS for ALT board has never been update accordingly.

    We didn't care about Alt at the time, the patch was done in the interests 
of the SILK board. I didn't realize the DU pin groups were used for Alt before 
the actual support was added for them. Thank you for finally fixing this!

> Tested displaying frames on VGA interface: the rcar-du driver loads correctly.

MBR, Sergei
