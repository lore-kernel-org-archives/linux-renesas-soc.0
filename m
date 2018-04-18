Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:39364 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751383AbeDROId (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 18 Apr 2018 10:08:33 -0400
Date: Wed, 18 Apr 2018 16:08:29 +0200
From: Simon Horman <horms@verge.net.au>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ARM: dts: renesas: replace toshiba,
 mmc-wrprotect-disable with disable-wp
Message-ID: <20180418140829.oi5pkn6hsiabe62i@verge.net.au>
References: <1523890952-20866-1-git-send-email-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1523890952-20866-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Apr 17, 2018 at 12:02:32AM +0900, Masahiro Yamada wrote:
> Follow up commit 788778b0d21a ("mmc: tmio: deprecate "toshiba,
> mmc-wrprotect-disable" DT property").
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Thanks, applied.
