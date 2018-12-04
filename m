Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:43051 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726309AbeLDOol (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 4 Dec 2018 09:44:41 -0500
Date: Tue, 4 Dec 2018 06:44:35 -0800
From: Simon Horman <horms@verge.net.au>
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sean Hudson <darknighte@darknighte.com>,
        Frank Rowand <frowand.list@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org, Grant Likely <grant.likely@arm.com>,
        Kumar Gala <kumar.gala@linaro.org>, arm@kernel.org,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 25/34] dt-bindings: arm: renesas: Move 'renesas,prr'
 binding to its own doc
Message-ID: <20181204144434.cin5sbg6gd27enf3@verge.net.au>
References: <20181203213223.16986-1-robh@kernel.org>
 <20181203213223.16986-26-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181203213223.16986-26-robh@kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Dec 03, 2018 at 03:32:14PM -0600, Rob Herring wrote:
> In preparation to convert board-level bindings to json-schema, move
> various misc SoC bindings out to their own file.
> 
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Simon Horman <horms@verge.net.au>
> Cc: Magnus Damm <magnus.damm@gmail.com>
> Cc: devicetree@vger.kernel.org
> Cc: linux-renesas-soc@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/arm/renesas,prr.txt   | 20 +++++++++++++++++++
>  .../devicetree/bindings/arm/shmobile.txt      | 18 -----------------
>  2 files changed, 20 insertions(+), 18 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/arm/renesas,prr.txt

Applied for v4.21, but should we add renesas,prr.txt to MAINTAINERS
as a follow-up?
