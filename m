Return-Path: <SRS0=Nz1U=SI=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 476A2C282DA
	for <linux-renesas-soc@archiver.kernel.org>; Sat,  6 Apr 2019 06:07:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1336A21855
	for <linux-renesas-soc@archiver.kernel.org>; Sat,  6 Apr 2019 06:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1554530835;
	bh=GMgqln23Icvm7bfdi5m4zgX6xmGBaZ9Gp0lRtdsQdHE=;
	h=Date:From:Subject:References:In-Reply-To:Cc:Cc:To:List-ID:From;
	b=y2EL0gsT/FbloIcKNY5vh+xS6ogbjXMXBPMXIhesU0NxG1Ba3Hg2/0pJXUtmynp92
	 kctX7pRE/MbtmT7qK94dyOlNHxG+yDERQoTZr2ewKRlm+z0IekmCDYZ4yNh0FGkU/P
	 do334Klp+9k17ozeI5sOBSicEHBmMRvMtcy4au4I=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726271AbfDFGHO (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sat, 6 Apr 2019 02:07:14 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:35068 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725973AbfDFGHO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 6 Apr 2019 02:07:14 -0400
Received: by mail-pg1-f193.google.com with SMTP id g8so4204015pgf.2;
        Fri, 05 Apr 2019 23:07:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:from:subject:references
         :in-reply-to:cc:cc:to;
        bh=sef9xa6JXWcnK6vYkyozbEF4F6PW+V0m6Lf6RWUog5I=;
        b=j6qUwShy6zJpPOxL9TOQV2C1qDgNX4dbbQmAqe+tqg63RRjp3oBnw0pTzj7+KTu9KF
         TKEPMkObd99wBzSgP6kNhLTuOPfGkQPckQApuzqyqlaz+2aPcaan5LMtfVyN1W6zpa3X
         u47IPc2Vu4MyCI8GcjDOEg2VB8q1jzaGCMn6PTDI0iRjOCJyoyF8JLbk4OvH7AjDgjYj
         xpNreKKRRmBM7lDu7Ie4vae3h0d/mB8anX09J/KF0j8JSGPjkBZN3zn98cVQMNsu9Zlb
         a99FzSZCRSWZaCCqn+/4B4LEfkIxFa8VOdPuyDcNMgMUbg484eedAK4kR1JXGWXSQYGM
         pLpA==
X-Gm-Message-State: APjAAAX/FOHzFgJoZMjRRDed1vd73aZ/BOQgSX6CmNgkEwgnByIdW3mU
        bc+iRy6gEkiGMJCJVW/ARCVRPVY6LQ==
X-Google-Smtp-Source: APXvYqy5BnS9/e9WhPmpFtkrYRTy32VsVrnmHE9ppx7SyTMAe7Xp+Lt+zduqA30tI8nxy+EO18+Snw==
X-Received: by 2002:a63:31ce:: with SMTP id x197mr15929205pgx.69.1554530833386;
        Fri, 05 Apr 2019 23:07:13 -0700 (PDT)
Received: from localhost ([210.160.217.71])
        by smtp.gmail.com with ESMTPSA id f63sm32034395pfc.180.2019.04.05.23.07.12
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Apr 2019 23:07:12 -0700 (PDT)
Message-ID: <5ca84210.1c69fb81.20175.d3ed@mx.google.com>
Date:   Sat, 06 Apr 2019 01:07:10 -0500
From:   Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V3 06/13] dt-bindings: usb: renesas_usbhs: Add support for r8a77470
References: <1554287324-22312-1-git-send-email-biju.das@bp.renesas.com> <1554287324-22312-7-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1554287324-22312-7-git-send-email-biju.das@bp.renesas.com>
Cc:     Mark Rutland <mark.rutland@arm.com>
Cc:     Biju Das <biju.das@bp.renesas.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Biju Das <biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed,  3 Apr 2019 11:28:37 +0100, Biju Das wrote:
> Document support for RZ/G1C (R8A77470) SoC.
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> ---
> V2-->V3
>   * No change
> V1-->V2
>   * New patch
> ---
>  Documentation/devicetree/bindings/usb/renesas_usbhs.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

