Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk0-f68.google.com ([209.85.213.68]:33694 "EHLO
        mail-vk0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751334AbcLOJ7a (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Dec 2016 04:59:30 -0500
MIME-Version: 1.0
In-Reply-To: <1922293.x1RvWWSErN@wasted.cogentembedded.com>
References: <1529351.Fac5N2tKoF@wasted.cogentembedded.com> <1922293.x1RvWWSErN@wasted.cogentembedded.com>
From: Magnus Damm <magnus.damm@gmail.com>
Date: Thu, 15 Dec 2016 18:59:28 +0900
Message-ID: <CANqRtoRg6RxnqQAmuqFw1sjC6+zUUKR+6cBt9tkCOnR-d06OhQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: r8a7791: link DU to VSPDs
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: "Simon Horman [Horms]" <horms@verge.net.au>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Russell King - ARM Linux <linux@arm.linux.org.uk>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Sergei,

On Thu, Dec 15, 2016 at 7:07 AM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> Add the "vsps" property to the DU device node in order to link this node to
> the VSPD nodes.
>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>
> ---
> This patch is against the 'renesas-devel-20161212-v4.9' of Simon Horman's
> 'renesas.git' repo.  It's  only meaningful if the DU driver patch I've just
> posted is applied.

Next time, please consider pointing out the exact name of the patch
you are referring to.

Thanks,

/ magnus
