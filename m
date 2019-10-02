Return-Path: <SRS0=voFw=X3=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42DBDECE58A
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  2 Oct 2019 14:19:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1185E21D81
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  2 Oct 2019 14:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1570025988;
	bh=VUWzUOsyjFHnxs2NsfjtUu26JJDc8rAXmDgj6rR/q5M=;
	h=Date:From:Subject:References:In-Reply-To:Cc:Cc:To:List-ID:From;
	b=BoOtLpcPG1LN7hC4lKJlwPvA6+ZmfNpBBEZHV+XPr94zqKMt0lS+MEcq1A8v/2WkE
	 bDRh+Zj8CGxcDIXTsWSGbdUZpQtJ7t/k7hdp6oRD29GMfA7PPsaHCN0IOhwgWFc/vq
	 bmP6c79tDdQl2EZjw+2oAisI6qI0GuQclJySpd70=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728287AbfJBOTq (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 2 Oct 2019 10:19:46 -0400
Received: from mail-qk1-f196.google.com ([209.85.222.196]:42898 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728100AbfJBOT3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 2 Oct 2019 10:19:29 -0400
Received: by mail-qk1-f196.google.com with SMTP id f16so15120294qkl.9;
        Wed, 02 Oct 2019 07:19:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:from:subject:references
         :in-reply-to:cc:cc:to;
        bh=VEtMxesFQRhVgaXfLOksqFQ3dcoeyOCvDlUvGQrsuFo=;
        b=SHW5fbScGckXwg1twupaQnPhg6ZbYvr8L6ogKyqPBzBJyRy3bALl3rAJIIK+cyM+Gc
         0AGD1Zb3SA5TRIteNu0KbeEjMgXwZYAlOKJlomqOhEHwZw6tg4Wt+DE1Va82TeT3KNrC
         SeiSzRAissFvHtug4lfNo8FQhOZJ4RmKp6Cbk6xPNodtyfkuKrjaYE9AlvWUdagNjMNo
         FidFEbl9icI0UAkNVM2YJg05stNtHbHhfsHIITL5per2w45XmY9OkGfQ0Fd4QOu0fpLB
         ylhMFJntFW4qWv67XI51L47eyA3Oj0YienCqSKE3W9AH1iHoC0JmPVH5mjzgKKT9K8pd
         v16A==
X-Gm-Message-State: APjAAAVDB8tk866GkERGYEvTbP3SBysDE0LUrdrZbJ/PX1fXstVDib1K
        uUjhLa0dpBcfoR7UIcizjg==
X-Google-Smtp-Source: APXvYqzagECSnvWAK2no15kXeuDvbNMmoSFzSS5uecaa8zyX8oPHLqD3j6y4NhItqADFSQbEDvOu5Q==
X-Received: by 2002:a37:a705:: with SMTP id q5mr3945294qke.194.1570025968939;
        Wed, 02 Oct 2019 07:19:28 -0700 (PDT)
Received: from localhost ([132.205.230.8])
        by smtp.gmail.com with ESMTPSA id b16sm14192592qtk.65.2019.10.02.07.19.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2019 07:19:28 -0700 (PDT)
Message-ID: <5d94b1f0.1c69fb81.bc0b5.9a58@mx.google.com>
Date:   Wed, 02 Oct 2019 09:19:25 -0500
From:   Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: iommu: ipmmu-vmsa: Add r8a774b1 support
References: <1569310854-37057-1-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1569310854-37057-1-git-send-email-biju.das@bp.renesas.com>
Cc:     Joerg Roedel <joro@8bytes.org>, Mark Rutland <mark.rutland@arm.com>
Cc:     Biju Das <biju.das@bp.renesas.com>,
        iommu@lists.linux-foundation.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
To:     Biju Das <biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, 24 Sep 2019 08:40:54 +0100, Biju Das wrote:
> Document RZ/G2N (R8A774B1) SoC bindings.
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> ---
>  Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

