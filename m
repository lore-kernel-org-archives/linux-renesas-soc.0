Return-Path: <devicetree-owner@vger.kernel.org>
Date: Thu, 15 Feb 2018 16:27:41 +0100
From: Simon Horman <horms@verge.net.au>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Rob Herring <robh+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: clock: add R8A77980 CPG core clock
 definitions
Message-ID: <20180215152740.qczobzwlixo3ogcu@verge.net.au>
References: <644095ad-42c5-a4fc-728a-76377938d2f1@cogentembedded.com>
 <7691d7f4-364d-bd7b-f9fe-ea49e7c2ab09@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7691d7f4-364d-bd7b-f9fe-ea49e7c2ab09@cogentembedded.com>
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Feb 15, 2018 at 02:56:53PM +0300, Sergei Shtylyov wrote:
> Add macros usable by the device tree sources to reference the R8A77980
> CPG core clocks by index. The data come from the table 8.2e of the R-Car
> Series, 3rd Generation User's Manual: Hardware (Rev. 0.80, Oct, 2017),
> however I had to add the Z2 clock which is somehow present only on the
> figure 8.1e...
> 
> Based on the original (and large) patch by Vladimir Barinov.
> 
> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

