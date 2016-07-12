Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f43.google.com ([209.85.215.43]:34888 "EHLO
	mail-lf0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750734AbcGLUag (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 12 Jul 2016 16:30:36 -0400
Received: by mail-lf0-f43.google.com with SMTP id f93so23146063lfi.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 12 Jul 2016 13:30:34 -0700 (PDT)
Subject: Re: [PATCH 0/2] R8A7792 clock fixes
To: horms@verge.net.au, linux-renesas-soc@vger.kernel.org,
	robh+dt@kernel.org, mark.rutland@arm.com,
	devicetree@vger.kernel.org
References: <1529351.Fac5N2tKoF@wasted.cogentembedded.com>
Cc: magnus.damm@gmail.com, linux@arm.linux.org.uk,
	linux-arm-kernel@lists.infradead.org
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <e3184a66-509b-209e-966d-3189f821c6f7@cogentembedded.com>
Date: Tue, 12 Jul 2016 23:30:25 +0300
MIME-Version: 1.0
In-Reply-To: <1529351.Fac5N2tKoF@wasted.cogentembedded.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 07/12/2016 12:50 AM, Sergei Shtylyov wrote:

>    Here's the set of 2 patches against Simon Horman's 'renesas.git' repo,
> 'renesas-devel-20160711-v4.7-rc7' tag. I've found a couple of issues in the
> R8A7792 DT clock descriptions, so these patches are targeted as fixes for 4.8.

    Oops, those were atop of the PFC/GPIO/EtherAVB patches in my series. After 
moving them before those, there was offset -185 lines while applying -- tell 
me if I need to repost.

> [1/2] ARM: dts: r8a7792: add PLL1 divided by 2 clock
> [2/2] ARM: dts: r8a7792: remove ADSP clock

WBR, Sergei
