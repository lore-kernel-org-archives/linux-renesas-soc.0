Return-Path: <SRS0=WiUf=EH=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F3B7C55178
	for <linux-renesas-soc@archiver.kernel.org>; Sun,  1 Nov 2020 12:10:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F1E772085B
	for <linux-renesas-soc@archiver.kernel.org>; Sun,  1 Nov 2020 12:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604232641;
	bh=69DURQxAJm5IPPyz0iqmP+j1BJ4QqpEDaUqp2moQ6yU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=pl07sOKB4v0dosAzZVw1PHX48wsJ3Qgk8G42HkHam/hj/STA26EB61Jhraq7w0KTj
	 g/ogDmI7PuRjudcWbMbV+rE16cbB2hfscHnA1LjKeAVHJ988DXp1STTq2LTMUiHz/d
	 br/0fMra/3qGhXtVy0ZMOVi4j7eYbL7SzwXvND0w=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726521AbgKAMKj (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sun, 1 Nov 2020 07:10:39 -0500
Received: from mail.kernel.org ([198.145.29.99]:46170 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726490AbgKAMKg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 1 Nov 2020 07:10:36 -0500
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A637C208B6;
        Sun,  1 Nov 2020 12:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604232635;
        bh=69DURQxAJm5IPPyz0iqmP+j1BJ4QqpEDaUqp2moQ6yU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=aikYv4TOLT1V5MPBqLWRoSG6JAjabmjO5d3kbnVtvissH43d+iRamPPfud9pKStJ6
         DAo9YvGSFOKlBaUe+JrnU1kQYBTo9h+SqcfrRaOwCF20R5BKE9Zdk7iQi0ZOCcYlGL
         1YwAkJ9ZS85myQkRX7TuDKWLuB/6Ln8egkblecvs=
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78] helo=wait-a-minute.lan)
        by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94)
        (envelope-from <maz@kernel.org>)
        id 1kZCBt-006PeF-Vd; Sun, 01 Nov 2020 12:10:34 +0000
From:   Marc Zyngier <maz@kernel.org>
To:     Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Geert Uytterhoeven <geert+renesas@glider.be>, nm@ti.com,
        t-kristo@ti.com, lokeshvutla@ti.com, ssantosh@kernel.org,
        robh+dt@kernel.org, Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc:     Ulrich Hecht <uli+renesas@fpond.eu>, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 0/2] irqchip/ti-sci-inta: Support for unmapped events
Date:   Sun,  1 Nov 2020 12:10:28 +0000
Message-Id: <160423261832.76459.5898965255364818721.b4-ty@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201020073243.19255-1-peter.ujfalusi@ti.com>
References: <20201020073243.19255-1-peter.ujfalusi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 62.31.163.78
X-SA-Exim-Rcpt-To: tglx@linutronix.de, jason@lakedaemon.net, geert+renesas@glider.be, nm@ti.com, t-kristo@ti.com, lokeshvutla@ti.com, ssantosh@kernel.org, robh+dt@kernel.org, peter.ujfalusi@ti.com, uli+renesas@fpond.eu, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, 20 Oct 2020 10:32:41 +0300, Peter Ujfalusi wrote:
> Changes since v2:
> - Extended the block diagram of INTA in the DT documentation
> - Use less creative variable names for unmapped events in the driver
> - Short comment section to describe the unmapped event handling in driver
> - Use u16 array to store the TI-SCI device identifiers instead of u32
> - Use printk format specifier instead of_node_full_name
> 
> [...]

Applied to irq/irqchip-next, thanks!

[1/2] dt-bindings: irqchip: ti, sci-inta: Update for unmapped event handling
      commit: bb2bd7c7f3d0946acc2104db31df228d10f7b598
[2/2] irqchip/ti-sci-inta: Add support for unmapped event handling
      commit: d95bdca75b3fb41bf185efe164e05aed820081a5

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.


