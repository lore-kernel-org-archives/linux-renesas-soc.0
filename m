Return-Path: <SRS0=Kbds=R7=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AAE5C43381
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 28 Mar 2019 15:35:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 562CA2183E
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 28 Mar 2019 15:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1553787350;
	bh=a/g/VYScVNYn2X2u3LhJghUOPr4oJjq5uMVncOPWdDs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=sZnypUJaKbNchkRYi65qRVEO1/9b7Vmelc7RS5v4BCiS0mgVPC6ptimvPLj6suXGp
	 pu/sjuBTRDZ0xX6VuPaRKbwVtVIwktc5juuNhHRkxEruTn6JAK1IoSUP4Llx8woM8q
	 vHxcP6vsw7LK+dm2NRMiAVkhIg2UOQWDLsVWYTr0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726243AbfC1Pft (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 28 Mar 2019 11:35:49 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:36897 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726046AbfC1Pft (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 28 Mar 2019 11:35:49 -0400
Received: by mail-oi1-f196.google.com with SMTP id v84so16115758oif.4;
        Thu, 28 Mar 2019 08:35:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=CUJVm6EVuy7yDOFxbk1DwgRak1DRjwAQ0UQn2Iy1xtY=;
        b=LB4kfXZQJwIslXsiGWX+OWrE5b0cphIuzJeu75jOttJQRd3FUWkRdlqpfHhJu+5eks
         OqlX2eqxvVpIw4ii/5oEVX9l+cs/wYodrfSg52RAnuRxX8h74DzFCPO1/WXmnmxZWC1Z
         uNdCkfFisLU0dVjzX10bFgjEIh1OE+IWJykJpGexJMew4z57YhjKK7qOUx2U/M8pO7mE
         wG4ZYTk7V5epxFdkyD5XkAKFtyJhJEdIH2cR3wXEEqhramzUn+y1QAhkNcQqbBZHatOw
         EVr6b7OULCt6cZj95U55bGc5ktR2ASiU2gRXLZRZlPrfmfIXgsJtkypueI+eb6UcyWPJ
         IOIg==
X-Gm-Message-State: APjAAAWoKTnnobVsEIuUKHaT4rGqL8lCd6Dq9qA9W+HN9KICUeltq/Gp
        s96vQ9R4wZzPm7S+WCkVqQ==
X-Google-Smtp-Source: APXvYqwgtZPrZGBWaw972d0+cJvMav3pASTxGZ9xh++Bwo3Ng0TAuhcsn2pYXXfoK4gZPGKw/Gvv9w==
X-Received: by 2002:aca:35d6:: with SMTP id c205mr435053oia.176.1553787348437;
        Thu, 28 Mar 2019 08:35:48 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id s23sm3436068otk.0.2019.03.28.08.35.47
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Mar 2019 08:35:47 -0700 (PDT)
Date:   Thu, 28 Mar 2019 10:35:47 -0500
From:   Rob Herring <robh@kernel.org>
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, Simon Horman <horms@verge.net.au>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 1/7] dt-bindings: usb: hd3ss3220 device tree binding
 document
Message-ID: <20190328153547.GA12413@bogus>
References: <1552552775-51667-1-git-send-email-biju.das@bp.renesas.com>
 <1552552775-51667-2-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1552552775-51667-2-git-send-email-biju.das@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Mar 14, 2019 at 08:39:29AM +0000, Biju Das wrote:
> Add device tree binding document for TI HD3SS3220 Type-C DRP port
> controller driver.
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> ---
> V1-->V2
>   * Added connector node.
>   * updated the example with connector node.
> ---
>  .../devicetree/bindings/usb/ti,hd3ss3220.txt       | 37 ++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/ti,hd3ss3220.txt

Reviewed-by: Rob Herring <robh@kernel.org>

> diff --git a/Documentation/devicetree/bindings/usb/ti,hd3ss3220.txt b/Documentation/devicetree/bindings/usb/ti,hd3ss3220.txt
> new file mode 100644
> index 0000000..7f41400
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/ti,hd3ss3220.txt
> @@ -0,0 +1,37 @@
> +TI HD3SS3220 TypeC DRP Port Controller.
> +
> +Required properties:
> + - compatible: Must be "ti,hd3ss3220".
> + - reg: I2C slave address, must be 0x47 or 0x67 based on ADDR pin.
> + - interrupts: <a b> where a is the interrupt number and b represents an
> +   encoding of the sense and level information for the interrupt.
> +
> +Required sub-node:
> + - connector : The "usb-c-connector" attached to the hd3ss3220 chip. The
> +   bindings of the connector node are specified in:
> +
> +	Documentation/devicetree/bindings/connector/usb-connector.txt
> +
> +Example:
> +hd3ss3220@47 {
> +	compatible = "ti,hd3ss3220";
> +	reg = <0x47>;
> +	interrupt-parent = <&gpio6>;
> +	interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
> +
> +	usb_con: connector {
> +		compatible = "usb-c-connector";
> +		label = "USB-C";

Arguably, not that useful of a label as it doesn't describe which USB C 
connector.

> +		data-role = "dual";
> +	};
> +
> +	port {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		hd3ss3220_ep: endpoint@0 {
> +			reg = <0>;
> +			remote-endpoint = <&usb3peri_role_switch>;
> +		};
> +	};
> +};
> -- 
> 2.7.4
> 
