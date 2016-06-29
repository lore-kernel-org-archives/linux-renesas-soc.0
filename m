Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f52.google.com ([209.85.215.52]:36702 "EHLO
	mail-lf0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751173AbcF2Qqm (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 29 Jun 2016 12:46:42 -0400
Received: by mail-lf0-f52.google.com with SMTP id q132so37604310lfe.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Jun 2016 09:46:37 -0700 (PDT)
Subject: Re: [PATCH] ARM: dts: r8a7792: add SMP support
To: horms@verge.net.au, linux-renesas-soc@vger.kernel.org,
	robh+dt@kernel.org, mark.rutland@arm.com,
	devicetree@vger.kernel.org
References: <14666252.G84Ipxe6EL@wasted.cogentembedded.com>
 <1627631.X1bJtVQHBF@wasted.cogentembedded.com>
Cc: magnus.damm@gmail.com, linux@arm.linux.org.uk,
	linux-arm-kernel@lists.infradead.org
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <7c23396f-f880-40ac-654d-cffc82df021e@cogentembedded.com>
Date: Wed, 29 Jun 2016 19:46:33 +0300
MIME-Version: 1.0
In-Reply-To: <1627631.X1bJtVQHBF@wasted.cogentembedded.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello.

On 06/21/2016 01:31 AM, Sergei Shtylyov wrote:

> Add the device tree nodes for the Advanced Power Management Unit (APMU)
> and the second Cortex-A15 CPU core.
> Use the "enable-method" prop  to point out that the APMU should be used
> for the SMP support.
>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>
> ---
> This patch is against the 'renesas-devel-20160620-v4.7-rc4' tag of Simon
> Horman's 'renesas.git' repo.  It depends on Magnus'/Geert's SMP patchset...

    simon, now that this patchset has been merged (for 4.8?), could you also 
merge this patch?

MBR, Sergei
