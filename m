Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ot1-f67.google.com ([209.85.210.67]:35590 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727013AbeJQX46 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 17 Oct 2018 19:56:58 -0400
Date: Wed, 17 Oct 2018 11:00:34 -0500
From: Rob Herring <robh@kernel.org>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Zhang Rui <rui.zhang@intel.com>,
        Eduardo Valentin <edubezval@gmail.com>,
        linux-pm@vger.kernel.org,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        linux-renesas-soc@vger.kernel.org,
        Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH 1/2] dt-bindings: thermal: rcar-gen3-thermal: document
  R8A77980 bindings
Message-ID: <20181017160034.GA14615@bogus>
References: <3c96d51e-fc36-2ff9-03a8-176c4c0ed365@cogentembedded.com>
 <e53d379f-bb72-51f7-9216-b3eb1bbe04b5@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e53d379f-bb72-51f7-9216-b3eb1bbe04b5@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, 9 Oct 2018 22:10:14 +0300, Sergei Shtylyov wrote:
> Document the R-Car V3H (R8A77980) SoC in the Renesas R-Car gen3 thermal
> bindings.
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> ---
>  Documentation/devicetree/bindings/thermal/rcar-gen3-thermal.txt |    4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
