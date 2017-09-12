Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f45.google.com ([209.85.215.45]:34946 "EHLO
        mail-lf0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750962AbdILVSM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Sep 2017 17:18:12 -0400
Received: by mail-lf0-f45.google.com with SMTP id d17so29585745lfe.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 12 Sep 2017 14:18:11 -0700 (PDT)
Subject: Re: [PATCH 11/11] arm64: dts: renesas: eagle: add EtherAVB support
To: Rob Herring <robh+dt@kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        Vladimir Barinov <vladimir.barinov@cogentembedded.com>
References: <20170912210547.471712392@cogentembedded.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <a2e8db4a-bcc7-edd0-7abc-37a74922a624@cogentembedded.com>
Date: Wed, 13 Sep 2017 00:18:08 +0300
MIME-Version: 1.0
In-Reply-To: <20170912210547.471712392@cogentembedded.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 09/12/2017 11:37 PM, Sergei Shtylyov wrote:

> Define the Eagle board  dependent part of the EtherAVB device node.
> Enable DHCP  and NFS root for the kernel booting.
> 
> Based  on the original (and large) patch by Vladimir Barinov.
> 
> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> ---
>  arch/arm64/boot/dts/renesas/r8a77970-eagle.dts |   15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
> 
> Index: renesas/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
> ===================================================================
> --- renesas.orig/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
> +++ renesas/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
[...]
> @@ -43,3 +44,15 @@
>  &scif0 {
>  	status = "okay";
>  };
> +
> +&avb {
> +//	renesas,no-ether-link;

    Oops, overlooked it, will fix!

> +	phy-handle = <&phy0>;
> +	status = "okay";
> +
> +	phy0: ethernet-phy@0 {
> +		rxc-skew-ps = <1500>;
> +		reg = <0>;
> +		max-speed = <1000>;
> +	};
> +};

MNR, Sergei
