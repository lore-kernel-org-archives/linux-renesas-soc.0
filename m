Return-Path: <devicetree-owner@vger.kernel.org>
Date: Mon, 29 Jan 2018 13:02:36 -0600
From: Rob Herring <robh@kernel.org>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Mark Rutland <mark.rutland@arm.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/2] DT: display: renesas,du: document R8A77970
 bindings
Message-ID: <20180129190236.5fdgtlwlkxzurljh@rob-hp-laptop>
References: <20180118211024.314876177@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180118211024.314876177@cogentembedded.com>
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Jan 19, 2018 at 12:05:58AM +0300, Sergei Shtylyov wrote:
> Document the R-Car V3M (R8A77970) SoC in the R-Car DU bindings.
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> ---
> Changes in version 2:
> - documented  R8A77970 DU ports;
> - patch split from the main R8A77970 DU support patch.
> 
>  Documentation/devicetree/bindings/display/renesas,du.txt |    2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Rob Herring <robh@kernel.org>

The preferred subject prefix is "dt-bindings: display: ..."
