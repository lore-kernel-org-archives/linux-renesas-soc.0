Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.149
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794298203;
	b=xCwnRaUlEVFQu6Df3c6SvwNByKiS/jNW9u2uuCP/OlDrHQIAddEaGD8JP1ZSgnprwMCx
	 5UIYehHhgzFEiBRBvgbTOoKYzqD+rQsFxnZtgg0bZZAQJcCyaGMxlKj/qJmJxbAkhaX8O
	 ulIWTmdDhO54UdMiBuIxx0je4oixTsqodIa3VhKCGd9/9mm7JIy4AR21/j5MrPvWldusk
	 V9AtDpNUmboFWlc35+t65ou3wS3yHcreV0Wt1q105dtRoLdKg34YFwbLzw9a9AnGGHNGa
	 xFVpLsHBjx6wKZmGMak4JsOWUHnIaNaU59YAhrQSTqoadEdvACUH1kmwIRB761LS4Zg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794298203;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=L7X08ZaDKejqmoDVsYnR15CKc4ooGxbHKPQKWY15LNk=;
	b=2HRu6Vs25TIk9db13GU8IcX/ftaYAlb36idjcTEm8/Vjo+Ltc/xz9u3U+zDP70UNzzLj
	 sRX55pT4i813gFDaB6HJx61++C6J0lF461+ShqmKZaa6UTuKIw8pC6lBAvP6F91mYJIg0
	 cKW4xbafZNKWjchkkLw690GBvPIsVwyVvWailcDjogfTSR+rXS5yTcFEN3/TwJZHM6It6
	 YQ4IXmqvMYQiM1eLHUgbSjH6fur5CiZRvum1mLz80m3hXoQBWc5UlBIZbEA3kpsocuqB8
	 AJMO+dCXVjsXHvXa0eGCYB1N7EGzYix7KMxDJl7wJpMAVVYqpIZBQl8N0hxzI2r9BNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ragnatech.se;
	spf=pass smtp.mailfrom=ragnatech.se;
	dkim=pass header.d=ragnatech.se header.i=@ragnatech.se header.a=rsa-sha256 header.s=fm2 header.b=smZzyaKt;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=DFgOGQUm;
	arc=none smtp.remote-ip=103.168.172.149
Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0677A60A263C
	for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Nov 2026 08:10:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0677A60A263C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ragnatech.se header.i=@ragnatech.se header.a=rsa-sha256 header.s=fm2 header.b=smZzyaKt;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=DFgOGQUm
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 3A9AAEC05D6
	for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Nov 2026 03:10:02 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Tue, 10 Nov 2026 03:10:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1794298201;
	 x=1794384601; bh=L7X08ZaDKejqmoDVsYnR15CKc4ooGxbHKPQKWY15LNk=; b=
	smZzyaKt7iVQLSJcvCcIr+qAmkb4G48diYMQa1s+tWLcvv0WDzRWkNdugfKZZ6Pu
	MBPNMXJ1zajaAtewGJbZZ2yaiFIa0AtDKzq5xfUfWYViyY2gkGN6PaGGFg9zbxbF
	s8VQxE6VSV86xF34XOCNAsOf7IuSIcRhVOtq8ahf+RwbKL/GK9gp5xryT1Zb4viQ
	W6rVvnvfUE1+OJpB+EU6NjS4fnfRX5hM65B91Xj6pVaCVY4o448dO5ed9ecXDMEA
	aUwhZjRkY7UXuCyZbGf21yzW/5XKjJvXZOueGY7UvjznjWCoy9YtRqorZH8fD6Lw
	Su6ILgW2bIxKwmFsEhQvsQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1794298201; x=
	1794384601; bh=L7X08ZaDKejqmoDVsYnR15CKc4ooGxbHKPQKWY15LNk=; b=D
	FgOGQUmPbUW7ipMN8vuGjyelpQ0IyQ0ZWEeLOXJtJOil9mNJ7g6nNkBZUiF6RzaK
	l6giLNTVDsr0K7qv3Dz3J7P6TD8QTRVXH3Q+BqzQJ45sZr4JcGy84RxocLi1mf2S
	cZJ4utdPsV8DUrlJLprDlY/HbVoEWj38XtklBo3HlKPWa1DHdX9vt1kyH8z1B/BA
	FYqAVPDFU6VVVlT73FPUnh06rKKRGDftKImOb6AybZ8oY3Ri8tCxJL15MfEj1FRk
	LXfw63fBHH/9uSA5+2P6XL5wE90nm/WwfyVahypDV8I8pjYag4wUTKIsHyU3lfQA
	vmLxh18aUag0nEZnq/Qqg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=ragnatech.se a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794298201; d=ragnatech.se;
	mf=PG5pa2xhcy5zb2Rlcmx1bmRAcmFnbmF0ZWNoLnNlPg==;
	rt=PGxpbnV4LXJlbmVzYXMtc29jQHZnZXIua2VybmVsLm9yZz4=;
	s=fm2:rsa-sha256:ys6eMRSpM+uSIj4uM7lui9167cyX2vNHd22IBzejBtp41mq
	8fRAQw7hxKdcNV8FLU/L2k+JFIhldUylxK9lD2EXCzrdXhF3cmBOxBXryOOkroq7
	EdFBP5uVxiUwoKoaH/I5W73idYSgVUdjoBDyapHQ1cx0E2vy8yTgqr5j2tNWcZ5z
	alwK53JtaUeAFo+9Yt84CLQQzorVXXHihjUpLRjMFWODpxE5YJuvqRnJvXnWfGjg
	1XiRc4AaAa4kn982cSO75hCW3kZfblYTlvoRGtKn2Crlai3tdIOCPcZTew8X+lMZ
	OGIz37bgo5dfZ01242gA6R9JPF9bL0gngTJ85eA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:QzMiz6hXEi+H3u1xNR3puK8mz4UjMhvECPG3etrAv/A=:QDHYz0joinfyqcMDnrAmhllDNNnbF/S0QcY6HnLCl/E=;
X-ME-Sender: <xms:WdHyakIyJ9SYod4wpSneN6-HtKNDfpJbU7JjRxhngzC4uqj3pkQCqQ>
    <xme:WdHyas5N2LnA53nNrpqPBMwrqo3un_d8H0uiqgqOQF01hGwEmN9RXA4sfQqaawb3P
    -nFfIhROb30PbMX_ChCqZaE0n_eFvuEsdJqJrFs57SIUHuZszL6C54E>
X-ME-Received: <xmr:WdHyajZUhx9uGef9FGeJbuQ9Um0-FWtnJU9nNIPwRhyKoUREAWblYxxWS7NW1h4fbX3mDr4ZcjvT60Tq_DvwXNq_zDOVois>
X-ME-Proxy-Cause: dmFkZTFJs/KhJ6SVSDBDZQ2cuGthrLhI26tG4AKadjP+rz0vKu8/vpVkZtjs3dDgzseOCx
    CQdwP9dxcEUOSOOaHycnESElSgKGWQSVjg9CnjuWwdALffUgiw7Cgtyk32U83e7/uiz5Au
    Tu3wYbKEqrO8HNNohxgKZqhwKT/fpVy4QnJPvVgh9zx+38otiGx+0iyOUvbNzswo/z2HJM
    +pT7iyuPv/q0O9nvEvbo1y0nNnCIcxaQI3BsEVAZwd9ailNOjj+x5S9nGtWK+/XL1pKlLM
    TfMQPsa+KkwRI/m/7CyjBwzWQqwpkJ7zuEINI+vnAqK/VnzWCezlnlN9k2YRVE6ycxcmfr
    hLRWlo/YTQJo4n/0qrG51q0GOd7vDSKbF4QpJLBIXCLDdspf0n6x2EIiXPoOCaY8kwSfDv
    CqGvyZ9Cz3nXlNzFafFa436SukLaOMX09p0eq6UboooHqsNnnQrUwY/61tOUSH/oUaTtbT
    Y1rVpsiZoXEgNLD87bVuQiUM3BJ3+oNZSCURiuMGgixhf8h0z4AW/Xb2FAwL4E2Xs1JpOQ
    gZUO38n+grUW/+XRGIAwOHNW9iV6myhCIvs7k/j01u6T141NZQsIYj0qrdVQNCfDBFhS4T
    8SZ1LDCBN4AKxTkE/ihnVzBlu0QGVhFLN/s4nVmLPRl1v/aR2zE54VIPx8+A
X-ME-Proxy: <xmx:WdHyajz2KdqO3qoNJpZXXmEbyrKROyu3Iw-tmTOvGY8Yc4knzYBtRw>
    <xmx:WdHyavN-Hjr5h_iiyCSvKMIezf-bkYivztnUrAsJ-Ki9zRm7pQJlNg>
    <xmx:WdHyah4WBes-kCOWkmDAhqY-iFd5Q2l_t1UxiJzW96DAjuUmcZhi0A>
    <xmx:WdHyaldoVyA0fcBaqoa83KV9bm7KeLbLGQ5X86VIQZOuSBjAgcmuLA>
    <xmx:WdHyagS590pe4-_8Fg217SPGY9lZk1RIA_cC_P4CupArufrb2Unqxpu4>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 10 Nov 2026 03:10:00 -0500 (EST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"DavidS. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Sergey Shtylyov <sergei.shtylyov@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH net-next v8 3/3] arm64: dts: renesas: r8a779g0: Add gPTP node
Date: Tue, 10 Nov 2026 09:07:27 +0100
Message-ID: <20261110080727.2377040-4-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261110080727.2377040-1-niklas.soderlund+renesas@ragnatech.se>
References: <20261110080727.2377040-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The gPTP module is shared between the RAVB and RTSN Ethernet devices on
the SoC.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
* Changes since v2
- Preserve sort order by unit-address.

* Changes since v1
- Rename node ptp.
---
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
index 5284923b6cef..f2d6696680db 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
@@ -606,6 +606,15 @@ mfis: system-controller@e6260000 {
 			status = "disabled";
 		};
 
+		gptp: ptp@e6449000 {
+			compatible = "renesas,r8a779g0-gptp", "renesas,rcar-gen4-gptp";
+			reg = <0 0xe6449000 0 0x500>;
+			clocks = <&cpg CPG_MOD 2723>;
+			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
+			resets = <&cpg 2723>;
+			status = "disabled";
+		};
+
 		tsn0: ethernet@e6460000 {
 			compatible = "renesas,r8a779g0-ethertsn", "renesas,rcar-gen4-ethertsn";
 			reg = <0 0xe6460000 0 0x7000>,
-- 
2.55.0

