Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:45370 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727077AbeJDQXY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 4 Oct 2018 12:23:24 -0400
Date: Thu, 4 Oct 2018 11:30:55 +0200
From: Simon Horman <horms@verge.net.au>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, linux-pwm@vger.kernel.org,
        devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: pwm: renesas: pwm-rcar: document
 R8A779{7|8}0 bindings
Message-ID: <20181004093050.kbrw5qagzxflb64r@verge.net.au>
References: <7f2ce332-a128-073a-762e-fb268780a145@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7f2ce332-a128-073a-762e-fb268780a145@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Oct 01, 2018 at 10:57:39PM +0300, Sergei Shtylyov wrote:
> Document the R-Car V3{M|H} (R8A779{7|8}0) SoC in the  Renesas R-Car PWM
> bindings. R8A77970's hardware is a generic R-Car gen3 PWM, while R8A77980
> has an extra error injection register...
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
