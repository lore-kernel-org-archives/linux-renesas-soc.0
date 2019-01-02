Return-Path: <SRS0=RWjW=PK=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F7D2C43387
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  2 Jan 2019 09:35:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 556CA206C0
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  2 Jan 2019 09:35:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="TYoxf6Qg"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728957AbfABJfH (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 2 Jan 2019 04:35:07 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:33463 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728768AbfABJfG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 2 Jan 2019 04:35:06 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id A3A0E25BE2C;
        Wed,  2 Jan 2019 20:35:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1546421704; bh=CEH74zdFgYENN8KWTexIdxy6mZkYKG2AlZpdS+Rp99w=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TYoxf6QgUSv/aJ8YVzvWIDHnnSvREJPDXqzIW1015CMaVvvacIt9E4/YJZBDSD+cv
         wi4sT4r3VJkyo/DOnqM2qncf3HtfAkg1FIyjynjlfFH4uRz95y3sLbMOONqYK+4Oe2
         U+oIXNPdVy5ZlERNPnAx/cSowIpz4O/ZOUpcLt2w=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id CE9399402C1; Wed,  2 Jan 2019 10:35:02 +0100 (CET)
Date:   Wed, 2 Jan 2019 10:35:02 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Magnus <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 3/8] arm64: renesas: ulcb-kf: add pcm3168 sound codec
Message-ID: <20190102093502.y4vzyv5rsrdp3ak4@verge.net.au>
References: <87va3h9kzy.wl-kuninori.morimoto.gx@renesas.com>
 <87r2e59ky6.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87r2e59ky6.wl-kuninori.morimoto.gx@renesas.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Dec 26, 2018 at 09:53:41AM +0900, Kuninori Morimoto wrote:
> 
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> KingFisher has pcm3168 sound codec. This patch enables it.
> Because pcm3168 can't handle symmetric channel on playback/
> capture, we need to handle it as different DAI.

Hi Morimoto-san,

as per my response to other patches in this series I have found,
hopefully, minor problems, when applying this patch.

When compiling I see:
# make W=1 dtbs
...

  DTC     arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dtb
  DTC     arch/arm64/boot/dts/renesas/r8a7795-h3ulcb-kf.dtb
arch/arm64/boot/dts/renesas/r8a7795-h3ulcb-kf.dtb: Warning (unit_address_vs_reg): /soc/i2c@e6510000/i2c-switch@71/i2c@7/audio-codec@44/ports/port@0: node has a unit name, but no reg property
arch/arm64/boot/dts/renesas/r8a7795-h3ulcb-kf.dtb: Warning (unit_address_vs_reg): /soc/i2c@e6510000/i2c-switch@71/i2c@7/audio-codec@44/ports/port@1: node has a unit name, but no reg property
arch/arm64/boot/dts/renesas/r8a7795-h3ulcb-kf.dtb: Warning (unit_address_vs_reg): /soc/sound@ec500000/ports/port@2: node has a unit name, but no reg property
arch/arm64/boot/dts/renesas/r8a7795-h3ulcb-kf.dtb: Warning (unit_address_vs_reg): /soc/sound@ec500000/ports/port@3: node has a unit name, but no reg property
  DTC     arch/arm64/boot/dts/renesas/r8a7795-es1-h3ulcb.dtb
  DTC     arch/arm64/boot/dts/renesas/r8a7795-es1-h3ulcb-kf.dtb
arch/arm64/boot/dts/renesas/r8a7795-es1-h3ulcb-kf.dtb: Warning (unit_address_vs_reg): /soc/i2c@e6510000/i2c-switch@71/i2c@7/audio-codec@44/ports/port@0: node has a unit name, but no reg property
arch/arm64/boot/dts/renesas/r8a7795-es1-h3ulcb-kf.dtb: Warning (unit_address_vs_reg): /soc/i2c@e6510000/i2c-switch@71/i2c@7/audio-codec@44/ports/port@1: node has a unit name, but no reg property
arch/arm64/boot/dts/renesas/r8a7795-es1-h3ulcb-kf.dtb: Warning (unit_address_vs_reg): /soc/sound@ec500000/ports/port@2: node has a unit name, but no reg property
arch/arm64/boot/dts/renesas/r8a7795-es1-h3ulcb-kf.dtb: Warning (unit_address_vs_reg): /soc/sound@ec500000/ports/port@3: node has a unit name, but no reg property
  DTC     arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dtb
  DTC     arch/arm64/boot/dts/renesas/r8a7796-m3ulcb-kf.dtb
arch/arm64/boot/dts/renesas/r8a7796-m3ulcb-kf.dtb: Warning (unit_address_vs_reg): /soc/i2c@e6510000/i2c-switch@71/i2c@7/audio-codec@44/ports/port@0: node has a unit name, but no reg property
arch/arm64/boot/dts/renesas/r8a7796-m3ulcb-kf.dtb: Warning (unit_address_vs_reg): /soc/i2c@e6510000/i2c-switch@71/i2c@7/audio-codec@44/ports/port@1: node has a unit name, but no reg property
arch/arm64/boot/dts/renesas/r8a7796-m3ulcb-kf.dtb: Warning (unit_address_vs_reg): /soc/sound@ec500000/ports/port@2: node has a unit name, but no reg property
arch/arm64/boot/dts/renesas/r8a7796-m3ulcb-kf.dtb: Warning (unit_address_vs_reg): /soc/sound@ec500000/ports/port@3: node has a unit name, but no reg property
  DTC     arch/arm64/boot/dts/renesas/r8a77965-m3nulcb.dtb
  DTC     arch/arm64/boot/dts/renesas/r8a77965-m3nulcb-kf.dtb
arch/arm64/boot/dts/renesas/r8a77965-m3nulcb-kf.dtb: Warning (unit_address_vs_reg): /soc/i2c@e6510000/i2c-switch@71/i2c@7/audio-codec@44/ports/port@0: node has a unit name, but no reg property
arch/arm64/boot/dts/renesas/r8a77965-m3nulcb-kf.dtb: Warning (unit_address_vs_reg): /soc/i2c@e6510000/i2c-switch@71/i2c@7/audio-codec@44/ports/port@1: node has a unit name, but no reg property
arch/arm64/boot/dts/renesas/r8a77965-m3nulcb-kf.dtb: Warning (unit_address_vs_reg): /soc/sound@ec500000/ports/port@2: node has a unit name, but no reg property
arch/arm64/boot/dts/renesas/r8a77965-m3nulcb-kf.dtb: Warning (unit_address_vs_reg): /soc/sound@ec500000/ports/port@3: node has a unit name, but no reg property

Locally the following seems to resolve this problem.
Please consider rolling this incremental change or another fix
into a v2 posting of this patchset.

diff --git a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
index 401c166599a2..5cfa193fa8a9 100644
--- a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
+++ b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
@@ -163,14 +163,22 @@
 				VCCDA2-supply	= <&snd_vcc5v>;
 
 				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
 					mclk-fs = <512>;
+
 					port@0 {
+						reg = <0>;
+
 						pcm3168a_endpoint_p: endpoint {
 							remote-endpoint = <&rsnd_for_pcm3168a_play>;
 							clocks = <&clksndsel>;
 						};
 					};
+
 					port@1 {
+						reg = <1>;
+
 						pcm3168a_endpoint_c: endpoint {
 							remote-endpoint = <&rsnd_for_pcm3168a_capture>;
 							clocks = <&clksndsel>;
@@ -294,8 +302,13 @@
 		     &sound_pcm_pins>;
 
 	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
 		/* rsnd_port0/1 are on salvator-common */
 		rsnd_port2: port@2 {
+			reg = <2>;
+
 			rsnd_for_pcm3168a_play: endpoint {
 				remote-endpoint = <&pcm3168a_endpoint_p>;
 
@@ -307,7 +320,10 @@
 				playback = <&ssi3>;
 			};
 		};
+
 		rsnd_port3: port@3 {
+			reg = <3>;
+
 			rsnd_for_pcm3168a_capture: endpoint {
 				remote-endpoint = <&pcm3168a_endpoint_c>;
 
