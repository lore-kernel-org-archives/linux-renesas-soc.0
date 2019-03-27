Return-Path: <SRS0=rp0x=R6=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90F31C43381
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 27 Mar 2019 23:28:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5D91B2082F
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 27 Mar 2019 23:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1553729285;
	bh=zb+1myAITb6GVxlk9dE5eLEYQIzZlgyE7lWl6ELW+kg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=161VqVlvKidiks45kpUzgdWjDyZNG+JAMee+4tU8qZTLiINqAefHYxdlHuXvr0jsc
	 tBet2reovTM2D1qlsm2jm0qCp1XZYjS4g8bpWgEEbmvzjqZb8qlqKvfWvx1ViXDFrb
	 Oe02Pe42i/oPSdzC1BPXFQHVafqkcgHkReQpZT/U=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728120AbfC0X2E (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 27 Mar 2019 19:28:04 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:44479 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726055AbfC0X2E (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 27 Mar 2019 19:28:04 -0400
Received: by mail-oi1-f195.google.com with SMTP id i21so14314419oib.11;
        Wed, 27 Mar 2019 16:28:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=WPPm+QnG4dsxAETBkjL30cHpvq3IzgiHf9yD+xdbe0E=;
        b=aKIUwK6YD48HmsEARHGdhPlBhchZNoPI2JJRRXSszkCuEApVxKvnpvaeSazD2gDaS0
         fKMADmcEm4ka0Bc3BMIm7fXu9yDF0p1fp6ZBK0HYLcwlYoqAc0Iggl8T+L7/4Fuzkr0R
         QzXliTkk/du661FHYgXH9rZDaHwyyMU2kb1QWUiMLFa85TT2uz8QxLEe6fNPKjDNedGk
         LsUX2aUcr+FPvQVvMbT1bvo+GkY5QWB4UZk2KoIY4eUR7iPQPiddpjCRMEtuwa+svEzw
         Z8ESTYbQ3lxje2zSwWWpwVQHsu9GiES/kKOqM8fcCakDP8fTvEiPOfIPWCzCyTapDltv
         7Wuw==
X-Gm-Message-State: APjAAAWMelItTNUq/1ljpBHH2eMIReB4Ovxy5azycYvlo4gbU1uJW3zK
        QUP8INyysfHdmpwNOCnC/Q==
X-Google-Smtp-Source: APXvYqyrg9pnn03boe/IrSJXgxZMrPUv9Tu/6oL7rBDJ0PoViT33lYjqOrNLXqrN/nGR4h9yTluTAw==
X-Received: by 2002:aca:5658:: with SMTP id k85mr21426375oib.166.1553729283276;
        Wed, 27 Mar 2019 16:28:03 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id n6sm9083682oif.12.2019.03.27.16.28.02
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 Mar 2019 16:28:02 -0700 (PDT)
Date:   Wed, 27 Mar 2019 18:28:02 -0500
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
Subject: Re: [PATCH 2/9] dt-bindings: usb: renesas_usb3: add extcon support
Message-ID: <20190327232802.GA28701@bogus>
References: <1551863246-11656-1-git-send-email-biju.das@bp.renesas.com>
 <1551863246-11656-3-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1551863246-11656-3-git-send-email-biju.das@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Mar 06, 2019 at 09:07:19AM +0000, Biju Das wrote:
> Add support for renesas_usb3 to receive connect and disconnect notification
> using extcon framework.
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> ---
>  Documentation/devicetree/bindings/usb/renesas_usb3.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/renesas_usb3.txt b/Documentation/devicetree/bindings/usb/renesas_usb3.txt
> index d366555..ae35674 100644
> --- a/Documentation/devicetree/bindings/usb/renesas_usb3.txt
> +++ b/Documentation/devicetree/bindings/usb/renesas_usb3.txt
> @@ -21,6 +21,8 @@ Required properties:
>  Optional properties:
>    - phys: phandle + phy specifier pair
>    - phy-names: must be "usb"
> +  - extcon: phandle for the extcon device renesas usb3 uses to detect
> +	    connect/disconnect events.

Please don't use extcon and use usb-connector binding instead.

>  
>  Example of R-Car H3 ES1.x:
>  	usb3_peri0: usb@ee020000 {
> -- 
> 2.7.4
> 
