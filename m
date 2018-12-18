Return-Path: <SRS0=VX+A=O3=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	USER_AGENT_MUTT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A478C43387
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 18 Dec 2018 17:48:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0BFE721850
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 18 Dec 2018 17:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1545155327;
	bh=pu8T7pdviGJYwDdKeTH8/zAyrPY2jn8WsfgvqOeA2mw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=u2/fnO3rlQUGnOu8/0BWvPqzZe14tBAtpr7JGGsSshytFnwTcLHg4FnHqX8L51cPy
	 EDo2G0pYjvfrY5Q1gO/PjzUjf5j3MKq1sGqajDMwXhDZLXtk5KTtUaG3KUv3xCbW6p
	 sf/AoXlGt9rAom2tcIUbnf92/fxJmDkW2GOoo8N4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727502AbeLRRsk (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 18 Dec 2018 12:48:40 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:35362 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727491AbeLRRsk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Dec 2018 12:48:40 -0500
Received: by mail-oi1-f196.google.com with SMTP id v6so2671953oif.2;
        Tue, 18 Dec 2018 09:48:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=PPQ647DNyV+MPXalzebEiBkeLN8Y6HqF40aQsm9T2+U=;
        b=e30vzQ0ay6uzYr7LKaz9d5ADpB7AZ0YLVdo1Xl5K+dwFTIJce0pw3hiTzWumzhrAgS
         pCXd9g4AvFLdsxvwAHj29481s8ncPVYn3znIfiVc07z4zFFtCVHj7pD8waMu0a4nPiQi
         UMMGSz/VwNKPhIorJkbCjYUPtHWeu2WRIy3iWJyoas1I34Q8dJA0j9gihkYnVgnr6TEd
         k3c3OnLVEg3EihhGNghBmbQst/OP6heLL3yMhahb3s4A9qk44LiJmI0v/L05fsumFuaR
         aTU5hq2ORRlHYZcHJqfaYBhM3VVYRKVnBBM+IR2e33htd0jIpni46c1IpinxKnUljULt
         e2mg==
X-Gm-Message-State: AA+aEWasif1e0lmYaT3RDNVxRMXJD616Tn+vrphr/wFg3eKsnAaYLjmB
        2LibwMjhfqahT09xlG7gKQ==
X-Google-Smtp-Source: AFSGD/XLDho1ap/CDyYl88dGlHsrKlzBQL4zms6TE/xsgz6d7Exuf8dOpxxRzSC9s4hqlOjCgNv0wg==
X-Received: by 2002:aca:654a:: with SMTP id j10mr7957741oiw.301.1545155319113;
        Tue, 18 Dec 2018 09:48:39 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id y25sm7320510otq.60.2018.12.18.09.48.38
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Dec 2018 09:48:38 -0800 (PST)
Date:   Tue, 18 Dec 2018 11:48:38 -0600
From:   Rob Herring <robh@kernel.org>
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: serial: sh-sci: Document r8a774c0
 bindings
Message-ID: <20181218174838.GA28308@bogus>
References: <1545134590-22510-1-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1545134590-22510-1-git-send-email-fabrizio.castro@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, 18 Dec 2018 12:03:10 +0000, Fabrizio Castro wrote:
> RZ/G2E (R8A774C0) SoC also has the R-Car Gen3 compatible SCIF and
> HSCIF ports, so document the SoC specific bindings.
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
> ---
> v1->v2:
> * Fixed title according to Geert's comment
> 
> This patch depends on:
> https://patchwork.kernel.org/patch/10565543/
> 
>  Documentation/devicetree/bindings/serial/renesas,sci-serial.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
