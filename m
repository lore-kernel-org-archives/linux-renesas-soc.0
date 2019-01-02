Return-Path: <SRS0=RWjW=PK=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FEF1C43387
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  2 Jan 2019 09:35:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4DF35218A4
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  2 Jan 2019 09:35:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="DKJ1jE/y"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728953AbfABJfC (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 2 Jan 2019 04:35:02 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:33459 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728768AbfABJfC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 2 Jan 2019 04:35:02 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 08FD025BE2C;
        Wed,  2 Jan 2019 20:35:00 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1546421700; bh=p2YcBRrIRpdTE9NWJpHGM4QQUSfkxKIZd6QQpNCC9J0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DKJ1jE/yDLzcu2G4YIBcnIpgNIGz+9kjrmDTeaT4I8WMYa8o7TozgdoTqwTSbYxzQ
         CrpVbnXHYhancEX8yampgwRteMDRzjMMETmD3kMy1wiAGeqyjElfcb3z6YxE1U0HjW
         hG4kFIIlyiOnOZ0WgNossdVha9xcs3hAkAvW3wnc=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 37CC89402C1; Wed,  2 Jan 2019 10:34:58 +0100 (CET)
Date:   Wed, 2 Jan 2019 10:34:58 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Magnus <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/8] arm64: renesas: ulcb: add HDMI sound support
Message-ID: <20190102093457.jmxwvlzyy6uwnwsq@verge.net.au>
References: <87va3h9kzy.wl-kuninori.morimoto.gx@renesas.com>
 <87sgyl9kyd.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87sgyl9kyd.wl-kuninori.morimoto.gx@renesas.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Dec 26, 2018 at 09:53:34AM +0900, Kuninori Morimoto wrote:
> 
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> This patch adds missing ULCB HDMI sound support.
> To use sound card, HDMI video is mandatory.

Hi Morimoto-san,

I realise that I previously indicated that I was happy with this series,
but I have found a, hopefully, minor problem.

When compiling this patch I see:

# make W=1 dtbs
...

  DTC     arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dtb
arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dtb: Warning (unit_address_vs_reg): /soc/sound@ec500000/ports/port@0: node has a unit name, but no reg property
arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dtb: Warning (unit_address_vs_reg): /soc/sound@ec500000/ports/port@1: node has a unit name, but no reg property
  DTC     arch/arm64/boot/dts/renesas/r8a7795-h3ulcb-kf.dtb
arch/arm64/boot/dts/renesas/r8a7795-h3ulcb-kf.dtb: Warning (unit_address_vs_reg): /soc/sound@ec500000/ports/port@0: node has a unit name, but no reg property
arch/arm64/boot/dts/renesas/r8a7795-h3ulcb-kf.dtb: Warning (unit_address_vs_reg): /soc/sound@ec500000/ports/port@1: node has a unit name, but no reg property
  DTC     arch/arm64/boot/dts/renesas/r8a7795-es1-h3ulcb.dtb
arch/arm64/boot/dts/renesas/r8a7795-es1-h3ulcb.dtb: Warning (unit_address_vs_reg): /soc/sound@ec500000/ports/port@0: node has a unit name, but no reg property
arch/arm64/boot/dts/renesas/r8a7795-es1-h3ulcb.dtb: Warning (unit_address_vs_reg): /soc/sound@ec500000/ports/port@1: node has a unit name, but no reg property
  DTC     arch/arm64/boot/dts/renesas/r8a7795-es1-h3ulcb-kf.dtb
arch/arm64/boot/dts/renesas/r8a7795-es1-h3ulcb-kf.dtb: Warning (unit_address_vs_reg): /soc/sound@ec500000/ports/port@0: node has a unit name, but no reg property
arch/arm64/boot/dts/renesas/r8a7795-es1-h3ulcb-kf.dtb: Warning (unit_address_vs_reg): /soc/sound@ec500000/ports/port@1: node has a unit name, but no reg property
  DTC     arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dtb
  DTC     arch/arm64/boot/dts/renesas/r8a7796-m3ulcb-kf.dtb
  DTC     arch/arm64/boot/dts/renesas/r8a77965-m3nulcb.dtb
arch/arm64/boot/dts/renesas/r8a77965-m3nulcb.dtb: Warning (unit_address_vs_reg): /soc/sound@ec500000/ports/port@0: node has a unit name, but no reg property
arch/arm64/boot/dts/renesas/r8a77965-m3nulcb.dtb: Warning (unit_address_vs_reg): /soc/sound@ec500000/ports/port@1: node has a unit name, but no reg property
  DTC     arch/arm64/boot/dts/renesas/r8a77965-m3nulcb-kf.dtb
arch/arm64/boot/dts/renesas/r8a77965-m3nulcb-kf.dtb: Warning (unit_address_vs_reg): /soc/sound@ec500000/ports/port@0: node has a unit name, but no reg property
arch/arm64/boot/dts/renesas/r8a77965-m3nulcb-kf.dtb: Warning (unit_address_vs_reg): /soc/sound@ec500000/ports/port@1: node has a unit name, but no reg property


Locally the following incremental change seems to help.
Could you consider rolling this or a different solution into a v2
of this patchset?


diff --git a/arch/arm64/boot/dts/renesas/ulcb.dtsi b/arch/arm64/boot/dts/renesas/ulcb.dtsi
index 76e128a01b61..065342f6d0dd 100644
--- a/arch/arm64/boot/dts/renesas/ulcb.dtsi
+++ b/arch/arm64/boot/dts/renesas/ulcb.dtsi
@@ -398,7 +398,12 @@
 		 <&cpg CPG_CORE CPG_AUDIO_CLK_I>;
 
 	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
 		rsnd_port0: port@0 {
+			reg = <0>;
+
 			rsnd_for_ak4613: endpoint {
 				remote-endpoint = <&ak4613_endpoint>;
 
@@ -411,6 +416,8 @@
 			};
 		};
 		rsnd_port1: port@1 {
+			reg = <1>;
+
 			rsnd_for_hdmi: endpoint {
 				remote-endpoint = <&dw_hdmi0_snd_in>;
 
