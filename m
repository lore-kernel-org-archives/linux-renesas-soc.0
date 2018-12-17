Return-Path: <SRS0=IwST=O2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2FC0C43387
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 20:49:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 60AEB217D9
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 20:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1545079787;
	bh=rnG/dTwDtARH8Z0coQheN1BFyhs0tuzLmTcMMjWlpjo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=dtEigwFFlhx1KWOQoAi1PGKfz64HenK+IW+CuTZaGIPNxam77BgrbLMO8dYG7/Yj4
	 gwuJItCxiOz6c7pvSu1PxaEP+XT6RTiwNt29nJxjHsF+iXrhZiUeXt3Cnu3mqPbb5R
	 7+b/kANQ40EvZW45UiYp7lgRT1giGSVa0VPgD00A=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726727AbeLQUtq (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 17 Dec 2018 15:49:46 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:40594 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726574AbeLQUtq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Dec 2018 15:49:46 -0500
Received: by mail-oi1-f194.google.com with SMTP id t204so142123oie.7;
        Mon, 17 Dec 2018 12:49:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=D8W4gEPe5SROQUFI12nyLd/nXiIDNTVQfG2vwPjxLwk=;
        b=mNkbPJd2YGXlQnMxVQ29SKaQGn+Z2A0rJObQogGbbLIyPUen2bAwNFpCOWv813n7LH
         7/bbWUuF5ZQFIWQcmRuTE5PJDItlAQbljbVvnOaLL8plHWiv8udCCP9LarYvquFabGDk
         YmfChFt5LUl5ATkunghPnA3vI/MmzEBQxzVT/1N3D4ushzZ9THq2aa63ZvPG4c58aAHF
         WY825mrgDm6kX6H31ty6fmY3MiTvFrI06hfG5MmQuGCcCxcamKnNWce9cg2v1xezRxpq
         p4OTHIb9/8XxwC3NTXOZ4frx5GdK0mxue7OI0emG/5rjzSYnREO3tAL75dQCKm3pPu4H
         4erg==
X-Gm-Message-State: AA+aEWau0oJO2yiLpH4JZ0UahYwlsoNXhfSpN6YDqVYxfT+6Uh6ZDmxA
        lQ6T4ZKNJ9nFx4kTi1S4BA==
X-Google-Smtp-Source: AFSGD/UhkECmWVoUBdw6M1dtfu7py8x24Wu/4lqtLTyjxr06V97kg2FXjNaxsgycbOzNe8wHgx8cZg==
X-Received: by 2002:aca:b302:: with SMTP id c2mr5933286oif.144.1545079785448;
        Mon, 17 Dec 2018 12:49:45 -0800 (PST)
Received: from localhost (cpe-70-114-214-127.austin.res.rr.com. [70.114.214.127])
        by smtp.gmail.com with ESMTPSA id x9sm6074266otq.73.2018.12.17.12.49.44
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Dec 2018 12:49:44 -0800 (PST)
Date:   Mon, 17 Dec 2018 14:49:44 -0600
From:   Rob Herring <robh@kernel.org>
To:     Yoshihiro Kaneko <ykaneko0929@gmail.com>
Cc:     linux-pm@vger.kernel.org, Zhang Rui <rui.zhang@intel.com>,
        Eduardo Valentin <edubezval@gmail.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH/RFT v2 1/2] dt-bindings: thermal: rcar-thermal: add
 R8A77990 support
Message-ID: <20181217204944.GA19990@bogus>
References: <1545058221-22529-1-git-send-email-ykaneko0929@gmail.com>
 <1545058221-22529-2-git-send-email-ykaneko0929@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1545058221-22529-2-git-send-email-ykaneko0929@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Dec 17, 2018 at 11:50:20PM +0900, Yoshihiro Kaneko wrote:
> Document the R-Car E3 (R8A77990) SoC bindings.
> 
> Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
> ---
>  Documentation/devicetree/bindings/thermal/rcar-thermal.txt | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Please add acks/reviewed-bys when posting new versions.
