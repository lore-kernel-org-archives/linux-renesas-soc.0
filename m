Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:59670 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932213AbdK2J4L (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 29 Nov 2017 04:56:11 -0500
Date: Wed, 29 Nov 2017 10:56:07 +0100
From: Simon Horman <horms@verge.net.au>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Rob Herring <robh+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] arm64: dts: renesas: r8a77970: use SYSC power domain
 macros
Message-ID: <20171129095607.x33pokvib4csba73@verge.net.au>
References: <20171128202109.031715810@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171128202109.031715810@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Nov 28, 2017 at 11:15:45PM +0300, Sergei Shtylyov wrote:
> Now that the commit 833bdb47c826 ("dt-bindings: power: add R8A77970 SYSC
> power domain definitions") has hit Linus' tree, we can replace the  bare
> numbers  (we had to use to avoid a cross tree dependency) with these macro
> definitions...

Thanks, applied.
