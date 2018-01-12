Return-Path: <devicetree-owner@vger.kernel.org>
Subject: Re: [PATCH 02/10] dt-bindings: display: renesas: Deprecate LVDS
 support in the DU bindings
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
References: <20180112005858.26472-1-laurent.pinchart+renesas@ideasonboard.com>
 <20180112005858.26472-3-laurent.pinchart+renesas@ideasonboard.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <7e7432fb-770e-d426-dfc1-1518975acd4e@cogentembedded.com>
Date: Fri, 12 Jan 2018 18:14:33 +0300
MIME-Version: 1.0
In-Reply-To: <20180112005858.26472-3-laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

On 01/12/2018 03:58 AM, Laurent Pinchart wrote:

> The internal LVDS encoders now have their own DT bindings, representing
> them as part of the DU is deprecated.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>   .../devicetree/bindings/display/renesas,du.txt     | 26 +++++++++-------------
>   1 file changed, 11 insertions(+), 15 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/renesas,du.txt b/Documentation/devicetree/bindings/display/renesas,du.txt
> index cd48aba3bc8c..8f6e0e118e3e 100644
> --- a/Documentation/devicetree/bindings/display/renesas,du.txt
> +++ b/Documentation/devicetree/bindings/display/renesas,du.txt
> @@ -17,9 +17,7 @@ Required Properties:
>     - reg: A list of base address and length of each memory resource, one for
>       each entry in the reg-names property.
>     - reg-names: Name of the memory resources. The DU requires one memory
> -    resource for the DU core (named "du") and one memory resource for each
> -    LVDS encoder (named "lvds.x" with "x" being the LVDS controller numerical
> -    index).
> +    resource for the DU core (named "du").

    Could we get rid of this prop altogether?

[...]

MBR, Sergei
