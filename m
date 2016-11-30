Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:52460 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S964808AbcK3KHL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 30 Nov 2016 05:07:11 -0500
Date: Wed, 30 Nov 2016 11:07:06 +0100
From: Simon Horman <horms@verge.net.au>
To: Niklas =?utf-8?Q?S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] arm64: dts: r8a7795: salvator-x: Set drive-strength for
 ravb pins
Message-ID: <20161130100706.GE2336@verge.net.au>
References: <20161128114614.11979-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20161128114614.11979-1-niklas.soderlund+renesas@ragnatech.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Niklas,

On Mon, Nov 28, 2016 at 12:46:14PM +0100, Niklas Söderlund wrote:
> The EthernetAVB should not depend on the bootloader to setup correct
> drive-strength values. Values for drive-strength where found by examine
> the registers after the bootloader have configured the registers and
> successfully used the EthernetAVB.

I believe this patch has run-time dependencies on PFC patches and will
result in a regression without them. Please resubmit or otherwise ping me
once chose changes are present in an (rc) release or immutable branch.

Thanks!
