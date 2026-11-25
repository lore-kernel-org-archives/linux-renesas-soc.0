Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795575815;
	b=bQy3wY8BqMsJHGhMV7s6PSoM4ijjcL2qsD+WcuUzQe852uRUGuYLIKLZPNuQsEobcRaS
	 3HCB+GIjy8syrD6XRNSjdld5GgOg50yDS4MREqjRaUIZzdozq7e56d7dF73UjMNOfzSd/
	 zY6SE7bxJ+jUrH5tlTPPKSlqpjvgobS53FPDp/EiRfktgh3IfNsbpRYPMk9YJ8HwJraWI
	 W11v4Pf6AVnCiebOFE5/AuovLgviMIlljU38hnyB3+19QxwxCUV5jI9qlKzfLBoRGHJcL
	 EJFT89EXfAGy+I/lRlSU13uFoph4C+bQ2/ZPR267+gqHuJADOq4zcTxTmL7gDeqWVtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795575815;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XvCX2nUztLlSyLc3rr2QnMaB+ZFYgpn3Aqh+iE3xR/0=;
	b=XoZDbunP7FtwHss+3UbYcZ8whoHYNWKuooJXvSa6Iz0xPdBQwnXxbUStS+K/7slnY71t
	 FYsy63EMRnEBFv8SPay06gDCF56BDHfOzJ/mHI2dOFoQuFFrlMb9MaEun+CCAQDr2n9wi
	 PyUyFl1fqg4aRRnjuEBmZ1YDbsexky+g0U76uThecRI9zTxIbVpEaB6oYMFKzFfzfpJfE
	 pHiAORx6q7JVLjRsM2XAKC7CIEs9d0c/e9N/QPHhBaf8O8wgP4gLIgwa/o1oRFQb6aRQ3
	 9pWvqfKjtOZc3HG8aOB+UjyanIa8XlyVV9ilFLKREgb82G3HhwqH60nlpWskXHREacw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K250yYr8;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68DB5606A31E
	for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Nov 2026 03:03:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68DB5606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K250yYr8
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-3282db206d3so4639901eec.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Nov 2026 19:03:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795575815; x=1796180615; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XvCX2nUztLlSyLc3rr2QnMaB+ZFYgpn3Aqh+iE3xR/0=;
        b=K250yYr8VhJKucuJrDdE4wC3EJVDYc1zcrQbeIN4v0mICSZKAv82YLJMJyMcVf4pQ+
         ozSVuKGtwSecHV771Mhe50NcBaQQZENBac2oR5vMM/LZxeGYuzaOSnog5Tj79lmeQsz7
         9qjf3SxFZ9RNtZH5lyYOaJlJyy8AK0vTbMS1dYO9Igdu7uxH7OJbnQM1mX/LUFG37Qko
         b4jKkyQstOQBNRE1Lq3edVuQdu14Ey3MwtPYoSSfT92lPQk49HjDkvTIORwVGGi+hble
         sq+yfQkFyB3n1lSMHHjh1GH280s+7aXlviiGCjXk+tzDK0LCC8jS1fYWayo+yXrbQibv
         6OGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795575815; x=1796180615;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XvCX2nUztLlSyLc3rr2QnMaB+ZFYgpn3Aqh+iE3xR/0=;
        b=NETeDYQedrbuXWOVU+jw/ZMA8cRo4JDICtDv+Uamr/J781qC3Hpez8EvBWh4Q7HbwI
         cvAFi9hhuxcrA/7fBzYQLEmvk6lxjyiPcwim2NfC4Xykj7r9YgO0cRJacnjVEC4XAMNj
         GyLGrzGDqgJfXuAe0Gpo+vQrcfgQ1QY1BIpWnKBxb9eWOsWHQl1S3rC26WLU6lRNk5RQ
         nH6QYz2H4CYUB9RJyjpLQ5StSgHFgFlEcRHxScAVgG4Yf6m/YXvCxLwhlfCbZRBvVt5L
         h4kISJnfcqSWq4aCEXzA6gJCb3oHnvblPYN2hjt0NHdER9QGBvVVG3UDkROeP7UPsUEP
         C3AA==
X-Forwarded-Encrypted: i=1; AL+hErElbKfmjtXWIbXaB37LS7bl5qLX4My48nq0S8kP8XqlrJuym61t5YY4FzACVS66pRRl0bAL0ke4IMCgKK3IuXaqMg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+oDsmNI3deMtK8qjdYB0P+IttGos44Og7dl3HDtC/M9BSqJ0F1
	zR8D0gxNNX2vjCGD7/UANgkIYt5/roCJDE9IUyFrkTg2l0zyWWjuWFoZ
X-Gm-Gg: AZFdTZcqZkiHrXrOxId+4aIm3PSZcl3Ik2yXA/gx+5Avxiawh1vuRNVrTmbpQnoNJd4
	HarxOxyKLzcThu5e6qF8yAcPXb6+U5gGmthyvTCVD8p/Oczs61j3d9okcVDIk/3i3TKOS2XSEIo
	OZZ33SZlFCNF/Hr9Qe8fg9Za/aoqhliUIeiXraAAR7B81orCpRLT8zMtv0ydSu+T319ifl9YWcJ
	MQ+P5AijdUSE6Pry7MBGdlXxQ1EDNMsszqdlr/TIhuRIOvtObxnShf4Y1smXTOxh1fxFxGOJkjZ
	ZCW9AuThuowmQ2QWF1cOMc0hsiqaNnkaqdTgYaXpHpoJze9R87iWuzCORWqOhOS8goRXfswr9zK
	7KTeyE6e5fw4mPOB7ZdgiXc7YMGpebboQQ6yF4ziKjXsujsjad1gI9vkhSlZuL4xKxLHYmDdGD4
	1/n4k4qUNY2KR+rLwo9WS/08ksxh1IdK+QATjRnJHRcU6ByY76C+74nF5AiKWdU4OzZ2oGdtsXP
	HzTdSe6MbSd6C3JoZlyMUo1yOyz6rfEYIuUO1q28ps5VXhoFBN1nDkALSGrJ/1BPbn0V5IIyTLj
	11vz7QQdTNSCPktYCAF0RePZMQdZoV2u48e97qEpXxPgeNpQBZxE+rTe3ejQS8hyoaRKh8AoM7K
	jwTJG09ERp8cZfldsbE5bpqFs7yMPjVedTij9U/U1mltoq5y9pCL9Zt1W7/XqRIfe3hTA
X-Received: by 2002:a05:7301:150b:b0:36d:a466:9d0b with SMTP id 5a478bee46e88-3856ef47c9dmr16503589eec.19.1795575814384;
        Tue, 24 Nov 2026 19:03:34 -0800 (PST)
Received: from lwq-server.tail118c18.ts.net ([74.176.208.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566fdce48sm52243475eec.14.2026.11.24.19.03.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 19:03:33 -0800 (PST)
From: Yaohan Li <shunsheng1218@gmail.com>
To: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/3] thermal: rcar_gen3: fix the interrupt handler lifetimes
Date: Wed, 25 Nov 2026 11:03:24 +0800
Message-Id: <20261125030327.953450-1-shunsheng1218@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261124095110.131258-1-shunsheng1218@gmail.com>
References: <20261124095110.131258-1-shunsheng1218@gmail.com>
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes the order in which rcar_gen3_thermal_probe() and
->remove() create and release the interrupt handlers and the thermal
zones.

Patch 1 moves an existing check; it stands alone.

Patch 2 releases the handlers from ->remove(), before the runtime PM
reference is dropped and before devres unregisters the zones, and
undoes a partial interrupt request instead of leaving the first handler
behind.

Patch 3 requests the interrupts with IRQF_NO_AUTOEN, initialises every
sensor before the request, and enables the interrupts and their sources
only once all the thermal zones are registered.

The driver keeps its ->remove() callback and the existing polling
fallback when an interrupt cannot be requested.

Changes in v4:
 - Split into three patches.
 - Keep ->remove() and release the handlers explicitly instead of
   handing the teardown to devres.
 - Request the interrupts with IRQF_NO_AUTOEN and enable them after the
   zones are registered.

Compile tested only: arm64, aarch64-linux-gnu-gcc 11.4,
CONFIG_ARCH_RENESAS and CONFIG_RCAR_GEN3_THERMAL.  No R-Car board was
available, so probe, the polling fallback, resume and teardown were not
exercised on hardware.

AI assistance: prepared with Claude (Anthropic) as a coding assistant; the
author reviewed the reasoning and takes responsibility for the content.

Yaohan Li (3):
  thermal: rcar_gen3: check for sensors before reading the fuses
  thermal: rcar_gen3: release the interrupt handlers from ->remove()
  thermal: rcar_gen3: do not enable the interrupts before the zones
    exist

 drivers/thermal/renesas/rcar_gen3_thermal.c | 96 +++++++++++++++------
 1 file changed, 72 insertions(+), 24 deletions(-)

-- 
2.34.1

