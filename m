Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:45829 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750939AbeEBHhJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 2 May 2018 03:37:09 -0400
Date: Wed, 2 May 2018 09:08:56 +0200
From: Simon Horman <horms@verge.net.au>
To: Niklas =?utf-8?Q?S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: renesas: r8a77965: use r8a77965-sysc binding
 definitions
Message-ID: <20180502070856.bbmt75cqkqpar3kv@verge.net.au>
References: <20180426193447.29565-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20180426193447.29565-1-niklas.soderlund+renesas@ragnatech.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Apr 26, 2018 at 09:34:47PM +0200, Niklas Söderlund wrote:
> Replace the hardcoded power domain indices by R8A77965_PD_* symbols.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>  arch/arm64/boot/dts/renesas/r8a77965.dtsi | 95 ++++++++++++-----------
>  1 file changed, 48 insertions(+), 47 deletions(-)
> 
> Hi Simon,
> 
> This is based on top of your trees devel branch from earlier today.

Thanks, applied.
