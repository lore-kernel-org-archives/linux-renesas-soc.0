Return-Path: <SRS0=bqQk=O5=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6838C43387
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 20 Dec 2018 20:34:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 64DB7218D3
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 20 Dec 2018 20:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1545338089;
	bh=OPULwwFhcOOz3opOU0r8BsJBpItaPvmPuuu3yjWpU4E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=C2b931pb+eSRehYcXjP3rpp08KqjNsQTayre1mM0/0G5x4goRzozKkuMcX3HDtkUn
	 G6ZO62DYUwpLt64ITJWrPmtcwFlDRIatvLVeTmbJ0b9Z1Ko/NarTMsJx7dWrNo1Acs
	 Vw0eRX6QqpW3wnGbh7L6KVL9pc5oZCC5J0MhHZJY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732321AbeLTUet (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 20 Dec 2018 15:34:49 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:43350 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732267AbeLTUes (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 20 Dec 2018 15:34:48 -0500
Received: by mail-oi1-f193.google.com with SMTP id u18so2983328oie.10;
        Thu, 20 Dec 2018 12:34:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=p0kj97/JA/6KPX1ql/1vAJIkgOF/pQnn0nZGJwn6ih0=;
        b=Eu6WNrAzzKSgsSyBhU59R+ezzEnoEEMiVuDTGCvfDXigPuPvQe6rcyX/O7X35bSZju
         Xzv1yJL/YwX4lutm+AIHdsyn76Ng3pHmRuTgP9JrzEMTQpIrzqsGgjRJHLGmxtDKRnQ/
         +jCL4j9Bq+pc+M4b6P0lLB2jrPcEOAS7pKwpAf5g9RTUGl8NRac6lg/wBCCedF2wECVv
         hXrRNFGgZoSE9lOiUHuZhlSbUgf7bEfZNeipRBLMOkGsPYtWoH1WwWG3JNn+x/q43nYt
         9S0Z72ZLPnwLGE0SFsLh6O4JkutSVvvuobrSD6Vcin0iVwdPuOOdoO+9erLAitrw4Mgl
         SoPg==
X-Gm-Message-State: AA+aEWZVfpx6ENSWv7wO/X/a1RFahxX8GToG1/r79IVeG0FwVrn0Kbzb
        E+2iTFfPfmtprS/QvbLlww==
X-Google-Smtp-Source: ALg8bN5PhBUsoBlwIrVvdQtOta7yKHiW+IZF39B0RrPUYz7koFILDFmU5e7MtohrtA7ZkdjCRms6JA==
X-Received: by 2002:aca:e283:: with SMTP id z125mr150404oig.23.1545338088062;
        Thu, 20 Dec 2018 12:34:48 -0800 (PST)
Received: from localhost ([2607:fb90:20d2:a5e2:49af:e73e:5a36:3b50])
        by smtp.gmail.com with ESMTPSA id o8sm10914048oia.53.2018.12.20.12.34.47
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Dec 2018 12:34:47 -0800 (PST)
Date:   Thu, 20 Dec 2018 14:34:46 -0600
From:   Rob Herring <robh@kernel.org>
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: irqchip: renesas-irqc: Document r8a774c0
 support
Message-ID: <20181220203446.GA16133@bogus>
References: <1544732284-5951-1-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1544732284-5951-1-git-send-email-fabrizio.castro@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, 13 Dec 2018 20:18:04 +0000, Fabrizio Castro wrote:
> Document RZ/G2E (R8A774C0) SoC bindings.
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> ---
>  Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
