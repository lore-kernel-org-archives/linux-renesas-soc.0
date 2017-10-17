Return-Path: <devicetree-owner@vger.kernel.org>
Date: Tue, 17 Oct 2017 09:54:34 +0200
From: Simon Horman <horms@verge.net.au>
To: Biju Das <biju.das@bp.renesas.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Chris Paterson <chris.paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH  1/2] dt-bindings: usb-xhci: Document r8a7743 support
Message-ID: <20171017075434.eytcjy66n63pmy2i@verge.net.au>
References: <1508148769-47488-1-git-send-email-biju.das@bp.renesas.com>
 <1508148769-47488-2-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1508148769-47488-2-git-send-email-biju.das@bp.renesas.com>
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Oct 16, 2017 at 11:12:48AM +0100, Biju Das wrote:
> From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> 
> Document r8a7743 xhci support. The driver will use the fallback
> compatible string "renesas,rcar-gen2-xhci", therefore no driver
> change is needed.
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
