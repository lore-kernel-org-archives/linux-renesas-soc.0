Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F216233ADB9
	for <linux-renesas-soc@vger.kernel.org>; Tue,  9 Jun 2026 01:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780968705; cv=none; b=MfaWMT0vcNIX2dvh+/E4Lz6uYsmKrcoB/W0SZ887SUtEYpg1FLhUmcioRbU2JltaMPFXKwX8yfSTtzkB/9nCRoyl8Ccf+SGIH4fl+5OZfL4pjHoxkdNtPxRZ27j0SwmfMZUAvLxa//+d+KOoHX45qsg9DHnnCYUYc8B0hk7S87c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780968705; c=relaxed/simple;
	bh=HR2XMi4IgvvxzIRMtqagLrtw+MsRURUfdGIgwEAiD3Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bH2qquREAf0Q9xxRdsg4q4atAoaB1Zhm2P+Zr2B2st+muQxMpAmFUqTGr9fLomk4Ucc+0KkJgPobR7oj8cTsBOtUkTSx2etzC8itcXTkysWXY+Sd4oLffmEkhpa94tapT9h7ljaCM/CSPooWhll6ZvtvK2Yxgqz6TsHBE4gr9m4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HyexNb1e; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HyexNb1e"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2bf30d530bdso50558275ad.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 08 Jun 2026 18:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780968700; x=1781573500; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fMCzgBaJYvdtNejaaNJmpNBT14tIkvDZ23jeMItsrVQ=;
        b=HyexNb1eOFLLdh0as21+T+4U69QcWURlFFY/wlb+ydzS0TOklHujAh6dGa+h47cevQ
         ajdblSXIx1w8Xt70jvwFHvRdU6pPl+pzWkNiye/aO78yr+r4vxOZZmqTh0KbgalKUZss
         50QfCqBZDZ8uAX7M6G+9KdsEGw7mKKuLXEI02zBpwFJlddL08YgkVaXZPA9KRYB0xlC/
         x5wodow4Hy/+gY79N2vrFcvvWJeakRhwQe/e4inm2h8MO6yTcanxpg4GQRwNMSvF72CF
         C4G7mJo9IEBqeY30FhsZtqRUAnI2gEeCd0V2YpEae87iT6lCkIFSEO3poXhYIesBARkE
         4usQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780968700; x=1781573500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fMCzgBaJYvdtNejaaNJmpNBT14tIkvDZ23jeMItsrVQ=;
        b=KgzswYPdh3TdLefEJhPtKYIUBkpC6qVAdUlYMkaShK0gQgZ/qqOUfo0nAkgzBVz7OG
         etGMjYry6U5FP89uMIjJRjgpLMK/qvLV2OPn0VGS9jYPWbLGIwwIkuWQoIGjS+ZnCsFH
         mGXeOKt7CunZpE1O2qFwNfdceizX9lQ6lKs0chl/nETDvsLZmlQCj5NRNwcNxZPvNPKY
         wyRrMOdHH0aEwM43OXre2t6ke1tke2uSs9p0XFNOcA/X5ynczCeUEI2TJdJk2qDJyeoC
         9peWbe8E7llAXuu4ok/6JX4KP/wNnVSYytQqTyyWcwRg8LxrA3LU64hxBiJaE30ffJAW
         v0Sg==
X-Forwarded-Encrypted: i=1; AFNElJ+94bLKd4J3Z3FTqEj729EIb26FLiqMKkSWlq6bevI3hX83VTVtMoezYjMiDDS5vr1HRAg9Irp1fxV+C/+PCqA1XQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywrywq8mcz8pxAGl34cPhOCCMioyRPJuOoQIod+dU/bICqF5/82
	SCX0TJWhluN9lHW6jeYu10+hn/hV9Rq/RDgssq72gMTGcqUef1LsSLTx
X-Gm-Gg: Acq92OEVMv4rndTfiFml83w/B7W47KzHdwMFeaJjqB3IZQFNcyEeaxrLWjSEprkeCT5
	PHiWxjiFmF9V5sLh3rcml4H/C/i02rF5/DXvi/w0acp8Gt2CS+EfEVvfafPRWuoC+Aci9Bcjry1
	Gom+fH8eVccSue0ChrG3/wgl87ynirw7aLYwjt1yPJ5TYinRKv7YasI3Ktd3Rw8aH+iP0QVzPQd
	mfjfu2VpCRuM7UPBgHPVUlEx0orkq9nntZO8Q0CDzIbnbugfiamjuDBLN5jYvwiq11rCGWjH6ko
	gTBYRXPFjOIFltmLgkEKMfvCKQLt4j6VSmQYj0Ru8wKPTMIdhUhoR+sp+NKyaxhZpemI25lPgvj
	18ORVYXgtNpJp/+QvAh/89EGndEazOVPxDRDWikPyaciBZMfs/hqCvX5xtzmHsjZkXpTNPvVE8s
	tXYKERPQc83cJUglvLjZixmZN9rCMEaI6aiaXypO0P6OJJrBv2dzS+xQCp3LCa/xyG8kaJ1g2CB
	EeGdNw=
X-Received: by 2002:a17:902:fc4c:b0:2c2:1982:527a with SMTP id d9443c01a7336-2c2198254f0mr143994245ad.16.1780968700102;
        Mon, 08 Jun 2026 18:31:40 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16609e627sm198765335ad.52.2026.06.08.18.31.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 18:31:39 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Mark Brown <broonie@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v5 03/11] ASoC: renesas: fsi: Fix trigger stop ordering
Date: Tue,  9 Jun 2026 08:30:59 +0700
Message-ID: <20260609013107.5995-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260609013107.5995-1-phucduc.bui@gmail.com>
References: <20260609013107.5995-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Call fsi_stream_stop() before fsi_hw_shutdown(). This matches the existing
order in the suspend path.
This change ensures all register accesses during stream shutdown are fully
completed before disabling the clocks.

Suggested-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v5:
 - Move fsi_hw_shutdown() after fsi_stream_quit() to prepare for
   subsequent patches that use fsi_stream_is_working() to handle
   in-flight IRQ handlers.
Changes in v4:
 - update commit messages 

 sound/soc/renesas/fsi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/renesas/fsi.c b/sound/soc/renesas/fsi.c
index 8cbd7acc26f4..800ac40f9680 100644
--- a/sound/soc/renesas/fsi.c
+++ b/sound/soc/renesas/fsi.c
@@ -1586,10 +1586,10 @@ static int fsi_dai_trigger(struct snd_pcm_substream *substream, int cmd,
 			ret = fsi_stream_transfer(io);
 		break;
 	case SNDRV_PCM_TRIGGER_STOP:
-		if (!ret)
-			ret = fsi_hw_shutdown(fsi, dai->dev);
 		fsi_stream_stop(fsi, io);
 		fsi_stream_quit(fsi, io);
+		if (!ret)
+			ret = fsi_hw_shutdown(fsi, dai->dev);
 		break;
 	}
 
-- 
2.43.0

