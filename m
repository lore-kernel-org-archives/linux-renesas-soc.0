Return-Path: <SRS0=dpDL=QG=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE83BC282D7
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 30 Jan 2019 16:39:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 95A222087F
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 30 Jan 2019 16:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1548866353;
	bh=atKTqsyrhvTfQ/5MTzy2a6GtNA4VvCJrB8al5tUcqFs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=WynEYJ+Bh5n2ldEdFsnLEROe2z+8cBD2KY9yOIjo6auawUYKWaWAzWY/CUipyVQe1
	 hg88lfCxS1RhRPlgV9RSujvAyId+tDOxvaHOO/dYnOIeXf6Kq8ONBBuqG5yMr0YRAO
	 8jjNwHGHbRhfZZvrV89nm1q4OEzo5LxbKOy5JI24=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731797AbfA3QjN (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 30 Jan 2019 11:39:13 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:36573 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726230AbfA3QjN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 30 Jan 2019 11:39:13 -0500
Received: by mail-oi1-f193.google.com with SMTP id x23so159552oix.3;
        Wed, 30 Jan 2019 08:39:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=T+Jp1LEThKL+YDJAWMrgd6tuTsazOU4WKirAzgxW+sI=;
        b=H4Siq0gYp3JNz2Z/v8hAKFf9VjAZypAFX2oqGsopj7NnECT49gwZrk+/I0SSh0MRVn
         UcY4oMuEyM5HsBzJ9cd+2Ym3LoCfZVLLryw/UUnWbSZ7c9b0a5irYAaLoHc5FB6KZqnJ
         NmhFvnx2zorJwJbQltcVhWs4fykWqo8rYCWHey+EUxRXAOF8WXB7VZZz4Z7143Vjx039
         4C/Fmn1olBCcZttzxQLgcX+sYGFXz+xsl7PFJc/BYurCuDZiRUMIZRziiF+izQAn7S7i
         ix3z9mr/O40jK2h3GNxiyu4JbPGJRyt3thLxSmgF2uLTQ2OYbWp82isKcaMR3ZSrx6Tb
         16HA==
X-Gm-Message-State: AHQUAuYhG2ImRHR9NWSZMHL8pYycPee85q+3myAYWKp5r6rRSs32lPFF
        Nq5S2jYqH+lPDKmWs8bfQg==
X-Google-Smtp-Source: ALg8bN4SPC7wzoYAn88WXnvueX1Jp3SlayQcOKzDn5GDhvsIY/HTOZ+a8HBDE5GtOHQ7ukGfcr0Mtg==
X-Received: by 2002:aca:1e08:: with SMTP id m8mr12297030oic.347.1548866352088;
        Wed, 30 Jan 2019 08:39:12 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id d6sm924010oia.30.2019.01.30.08.39.11
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 30 Jan 2019 08:39:11 -0800 (PST)
Date:   Wed, 30 Jan 2019 10:39:10 -0600
From:   Rob Herring <robh@kernel.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Biju Das <biju.das@bp.renesas.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Mark Rutland <mark.rutland@arm.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org, Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: Re: [PATCH v3 2/5] dt-bindings: display: renesas: lvds: Document
 r8a7744 bindings
Message-ID: <20190130163910.GA29033@bogus>
References: <1548170749-12773-1-git-send-email-biju.das@bp.renesas.com>
 <1548170749-12773-3-git-send-email-biju.das@bp.renesas.com>
 <20190122154428.GE11461@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190122154428.GE11461@pendragon.ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Jan 22, 2019 at 05:44:28PM +0200, Laurent Pinchart wrote:
> Hi Biju,
> 
> Thank you for the patch.
> 
> On Tue, Jan 22, 2019 at 03:25:46PM +0000, Biju Das wrote:
> > Document the RZ/G1N (R8A7744) LVDS bindings.
> > 
> > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> and taken in my tree.

But not in linux-next? Or you did some $subject fixups which breaks my 
detecting that. :(

Rob
