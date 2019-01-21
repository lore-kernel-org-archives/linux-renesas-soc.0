Return-Path: <SRS0=sDbg=P5=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BAE6C37120
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 21 Jan 2019 21:10:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4A04C21019
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 21 Jan 2019 21:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1548105016;
	bh=MZ+vbigmb4jTYo8SFLEAWwxqMJLXp283sjVgmhPfha0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=tkwpBJCF5/MdEUjWZuacu9CRKXshb1Oc0pZ7vy1cEZLij/xx8Uqw5HK6FTuu7SvzV
	 NAulTK96KXgdVtX8cNZ+SHHuDgdevk7y3+qabu2KZXCZfdA2cdLJyhtmXpgc6tQsI5
	 sHkZvuSNm4Vk7yZHuwnBc0dFtb9sOnNgYLazh22w=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727721AbfAUVKP (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 21 Jan 2019 16:10:15 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:35052 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726837AbfAUVKO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Jan 2019 16:10:14 -0500
Received: by mail-oi1-f196.google.com with SMTP id v6so15682736oif.2;
        Mon, 21 Jan 2019 13:10:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=6dSSgUolPr/TiqGfOfZ5w9Gr95wwyUeD1ifLNlrKVUk=;
        b=UUp3r/M/DafFxgipDct8lKj3mVZRCOLRhCOk0JZdQ/xVrLf5eunr7syetFLEoXEu1S
         hNxHeYWU/VuG7k4rgG9EYQeJrvcd5rBbK/uZYn1ZAuIUiq1hw3vo1sDVx+3N1zA0yJzx
         agkeGNPtdWiWdz9m02Pg1OfG4f5uba/+tOPM0rvE6QYc180hkuE+IvdO5B4rHA0605t7
         wLVM26SloFG2jj3PyM2LuawA1mnV/uBlLYKc/t5Xaaw/eYC8OXf2EYOMGuYeF70RJfUd
         G2mj9UZlYVIfr52nClffw593J4HEMavd8UTOEomuncGK6LGis3eMXwuATsRBV5Ycfogt
         t11w==
X-Gm-Message-State: AJcUukcM9iLPjCY6f5JmkdbcOo475gahpyw9oMKBP/xh6msgjD8l5fwa
        kuzrtGqMFQPwo8y4w8riZA==
X-Google-Smtp-Source: ALg8bN7Aah4UTDWPZ9vyx6hpMIir19hDeh7J88qaDOF8RIv4CnzPNX3jIR3orPX0x45eoxIAVNNXTw==
X-Received: by 2002:aca:100b:: with SMTP id 11mr6374931oiq.303.1548105013642;
        Mon, 21 Jan 2019 13:10:13 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id i5sm6645160oia.46.2019.01.21.13.10.12
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Jan 2019 13:10:13 -0800 (PST)
Date:   Mon, 21 Jan 2019 15:10:12 -0600
From:   Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Subject: Re: [PATCH] dt-bindings: serial: sh-sci: Document r8a7778/9 HSCIF
 bindings
Message-ID: <20190121211012.GA28673@bogus>
References: <20190110153012.21024-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190110153012.21024-1-geert+renesas@glider.be>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Jan 10, 2019 at 04:30:12PM +0100, Geert Uytterhoeven wrote:
> From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
> 
> Document support for the HSCIF serial ports in the Renesas R-Car M1A
> (R8A7778) and H1 (R8A7779) SoCs.
> 
> No driver update is needed.
> 
> Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
> [geert: Patch description]
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v2:
>   - Picked up from Ulrich and rebased against current.
> ---
>  Documentation/devicetree/bindings/serial/renesas,sci-serial.txt | 2 ++
>  1 file changed, 2 insertions(+)

Applied, thanks.

Rob
