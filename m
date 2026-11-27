Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795809788;
	b=1WkH17VwKMDxl2aw6VNrs2vTfvBqS/mW6sPV0xA0maBbpC9IbwtWZ0oQZfHOdh/dse02
	 iYA78PdbGD7NfKtfd4VatrCoyudpWHIwrr3eHd9Tzl4pQmkKKFptNGKaYdzMuzMLMF4qt
	 ghzx0QCQmnr97cU3UcJNHSAbM4bV5kurP+Z9bUooyfSY77+hJNVzzqRJHhYKNUOsfM2LP
	 DDe4SvWz6LZU/l7v0YExRHTtkI8stCc5/xOC4hn0BqkLOzGJHgCebXygqLSDHQ0l43AFP
	 69vj34KXBkT+HAP3bVrWAZbr1i/5PG08bRcOf82y9R7T5IqsTLFy/jtVFLd1kb0wdaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795809788;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=wtusPwl7oTxkglScGF7WcIoLENdcCkcXrxudV6XyW/M=;
	b=Y1FlYXdADZ6NH10RS1phY8UNy1aS98IRec0WS4HSC9nzEl0rcyfh5JHs6h0IrBb6FSb6
	 A6m9PHJdodF/QhgaikKe/FXLS9lbxLtCDUv8jT0Grw2JNcK2sEvCU2zdED/2ylSrubiqm
	 MKWdJjH6mM0gTD6u/s5bZmR6CTJaB1A9bBH/mE4XbYD8QTN0PZ6uvEyvH3vCtuzJ9oZyq
	 mTJUAIf1QDNOsB4V36sqly/zhYDohfXweb0LADJzsV7QAqi+G0cqvNEqhpxABcgzOOzeI
	 VMmDd3oLOU/idW3A3+mVjJq3HRSpk5y0zP/nIBLJDg8iHRqNXu2xR5INDWExcbMD2bQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=n2R6FiKp;
	arc=none smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60170606A32D
	for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Nov 2026 20:03:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60170606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=n2R6FiKp
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c5198302d38so674981366b.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Nov 2026 12:03:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795809787; x=1796414587; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wtusPwl7oTxkglScGF7WcIoLENdcCkcXrxudV6XyW/M=;
        b=n2R6FiKpuo8g8obEOm2WV36wL4nr03F4a4p5Nyd0b2wdtPQbbdxheWIYRfJxzmZb3+
         O2uuDZi0uiaRR82uvCRPvAceWhP6zDVXz1OoocXKjcgBdfGYu5+22YfyBooVCoPKn0vb
         r3D8qlvSHEZrhAGWsfmzXQbzDcPYrHAIRTqsZ8RA+mGo9ottqiGedVNrCrZjIfpbMUbK
         daqNU1T6ZxAeN6QzRxvkmpuSn/9lf6SmQK+ByQ8IC8jIHeNICeMgIr5qlFtzEkXyQDnP
         aumrrQUn8yPuqlr1pakQcTxfinAX7L31iaQpgA14Yqa4x1BmedsGkQVWOQm/ejRHzr28
         OTDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795809787; x=1796414587;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wtusPwl7oTxkglScGF7WcIoLENdcCkcXrxudV6XyW/M=;
        b=WA5ZKp75VKyOqMgKg8iO93XEpXmML/H6PmSkm9/hnCEExUAsOZeYU5cVHkP7GcBte1
         CZhFcE5VlAoYISPCjKAUh7fIcLJwq8Gfexa1lmif/zmPZHZ78UrsxJytnqQWBO7hI6lb
         zAkKwThG3rRxZ4l0myy+9pAa2R5x+9pX8IT15+bx3QqJOjHKMC9FWeiXLnXbVmLPGuWC
         7HKvSyqPVfsYWrf12EBuyH7OalnKyn6ze7oz0fLcd1KWOsjTiWuozgSEZHs3Dw60mPgN
         Wx/usa2rMasOowXHHV1whHs57ekDFqx4zyWxd7mUBwUoB+cN0kNxcbcgKXKpjx1kUz9r
         xuTQ==
X-Forwarded-Encrypted: i=1; AL+hErEVJRHpjZVwMHddwZuzp/1xc54SNOIvRKvk9tMO8UmYmnPDHPKWZ9J5e2mb40P6LtNLEW0hPWLB+5L6nJH+SabbsA==@vger.kernel.org
X-Gm-Message-State: APuU4Z91J+Mfx5P6OIluuqhgiR75bvIjeD4NAWFnZy/lM7Ujf41bHeK7
	4NuFsjMuMZO1vs62jTbASgQ3yDNIIlWQprBXxkQYfJehpL0mT6D/RA8kWtnrxer0RLg=
X-Gm-Gg: AZFdTZeNiEzpprQPw9G17tW2NNHfvhKzXvWtsslqhh4805s+GisDXj0ZXn6KTh+F/yJ
	MTVptFbJMR5C2x3DcDdpk9N4643OGo+/BZLojq9ubPA+qLoh6MgIn+mRq45aO7dOPJ27+JqCqGr
	M5Rb9IK7+sNWqLOzdPa2yLnvwCr5jePLjf2mYrrm3ps5Lusc8KZb9RP6RX04ZX5QPTY+U+Q42/x
	dKXY2pjwlniJ80HGMvrHyFjz3otF8HLew1gndV+Xrg0swxapkDKjE/4EgqNW0jJm6nzePGDsLjB
	JmFvvRcfT/ZpRHxSTNnYl/+0W+4YJtKIN1dXtCtJ5vugqFfYjiEIqRF3f2DiyAq5OHTVKnuPBty
	SdhC6kN6gQlvCc/oeZVv1ihQYJDx26PNPjGJd7cZ2waC71MInJzliFEva/O+O/Wg4DxvUx90fhe
	rJsTfyasCBzxVuziDbp1KSyuDuSr9pJuldedyXpK/Cw1h2Wb5xSV9MIpZox+gGa5Bo1cE614XhE
	sml1iN+RYdly8p222LOECNT6aM3N4uvbLdb8k9BjsZiiudOw4zoPWIhGEWc/HWenb+/KlAucOSH
	lyP6oFklgPrDj+ye1Gri53Ksh6ZKbhW0u/b1hOgVnAKG1yet
X-Received: by 2002:a17:906:5908:b0:c3f:d8f2:f08e with SMTP id a640c23a62f3a-c513aad1aa7mr1591096666b.44.1795809786817;
        Fri, 27 Nov 2026 12:03:06 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae661b3sm897861366b.16.2026.11.27.12.03.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 12:03:06 -0800 (PST)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 2/6] clk: Add dev_clk_get_from_provider()
From: Jerome Brunet <jbrunet@baylibre.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Russell King <linux@armlinux.org.uk>, Paul Walmsley <paul@pwsan.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andyshrk@163.com>, Ulf Hansson <ulfh@kernel.org>, 
 linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-omap@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 linux-pm@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
In-Reply-To: <7155949aea78042fd399da5ad23a72765b2b6cc7.1795094688.git.geert+renesas@glider.be>
References: <cover.1795094688.git.geert+renesas@glider.be>
 <7155949aea78042fd399da5ad23a72765b2b6cc7.1795094688.git.geert+renesas@glider.be>
Date: Fri, 27 Nov 2026 21:02:59 +0100
Message-Id: <179580977969.3028968.47907747276860033.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=576; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=w+BoHiPo+P6YGPZSkRwTWt/kGI08hfYqlVrPoLWDzrs=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDNmcD781zBdazCsg9lL/zber23mznz9vt33xqqNRSyql5
 9/lP4XqHaUsDGJcDLJiiiw13NXi7yS1vsyarnMbZg4rE8gQBi5OAZjIejtGhnPrDj/t/PYpMF4p
 5/BazfN3D21QT/A6eNT9yBfJZ1dZop8wMpzYzS/A8uDOTLmdR+uChb9oSs6TL/Rb7JC9947joo3
 LLnMBAA==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

On Thu, 19 Nov 2026 14:40:35 +0100, Geert Uytterhoeven <geert+renesas@glider.be> wrote:
> Clocks obtained through of_clk_get_from_provider() show up as
> "deviceless" in the consumer column of the clk_summary file in debugfs.
> Add a new variant dev_clk_get_from_provider() that also takes a consumer
> device, so callers can provide it, and consumer's name will be shown in
> the clk_summary output.
> 
> Reimplement of_clk_get_from_provider() on top of
> dev_clk_get_from_provider().
> 
> [...]

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

-- 
Jerome

