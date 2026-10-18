Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4833835675E
	for <linux-renesas-soc@vger.kernel.org>; Sun, 18 Oct 2026 02:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792291622; cv=none; b=NvHvAyCiivM2QKIqp1E277er5zS3750NP9uqZvk5YtX39GoETT5pI8D/UJbVeAf69FurWCprchycUCx9wryj7Y/nbpJfj0uYbNmJOqMtJygz1Qph3tdRYZsG1cEzn3ZIyDilkZcfdgX79+ensnSVgqQETrIYqRVz7WKZtLf7QwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792291622; c=relaxed/simple;
	bh=m2mukGgWpT8Az5wlIU2EvwStqt6PAPojcdqQXE9F66Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uTc74QXmTwjiE29X7l+OjgqGPe2ouJT5WthgX6VrzjPeqeHAiJ1ebpWsZm/p/3QRXi+ycA447MQGNwD6BGNexthhxoIvQ78dYQR+8Hly9mcjQ5rw4F8HlNKWETkKlpU+YDRiF/Xa4O3u83S/I46EOCx7CwT7fwLWaCQdw6QZ8ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IKeJxvJX; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IKeJxvJX"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-5364648ae07so10177871cf.1
        for <linux-renesas-soc@vger.kernel.org>; Sat, 17 Oct 2026 19:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792291619; x=1792896419; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gvBoQ0rQ41gn7VwVg0MB+Jrp9Py8V8GgFAA5woLhjm4=;
        b=IKeJxvJXciYl4WpdLh0KQivoujSDXKVKZzQl8xnw8gQUeZI/eEnSF2RGgI7foTJ1Wi
         L8/bXgiLWKDNhiuS+ZkeymIgZbIGtxuzgc4QCiSEfo184f5jv5ZW6WL5dnJU7GeFgjL0
         kxpy/B93oDHQ+AHBjdtO9oLajO153ZxicHsna8Lo3qYRpsRS1ALRvnAWo8q55NI/2suR
         Q856DWDAsykhoGVzK2bNvi424PjSiHn7b5jqkigmfsIFZLUgwlNOQKXGSHkz7rvf3vds
         Sq29kbGFEnqaffs75g/wQijdZmF3RY4VE1cAMxhwf2p2MxStoJXjFTpqjtnC76Tn5SqN
         CMDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792291619; x=1792896419;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gvBoQ0rQ41gn7VwVg0MB+Jrp9Py8V8GgFAA5woLhjm4=;
        b=zQcpvzNlkhWBT4DE6RsV4b3GN3dXh5USvxrmU9RGk7LfFIZHeBuiqcwD02M+i3kcA6
         mIkiIt1kb1DKUVhrv2p91zSQs3ifhPjLCqFFyiBNgEtlCkwWPZHKxUJcvOcv4l9FcWhS
         QMPjQvJRCJ4/5YMH6l8glkPfEsnkTCCS0jSeh4dE25eH4eWNQ2cGjtDjLK/ZpWSbmZyw
         MF+otgQR/hFh5lPFfYisF0CwkjEoLf+D7gSslTOsZmAAXdAWz0mpq6M0ixctf+r0Q4KW
         lFeTKZz8/wbIm1qTXp0OTzV2yIfzpSWmW2yY7mpxTBVZ3CYfns74zNTTDyjPlK9mMNfY
         rWZQ==
X-Forwarded-Encrypted: i=1; AKwUvBxzrD294155vmBvkBFVIcyvA5F0lYnOdpACPQ1u9IhkSdMImh9AetI/qU9QREmiq4FN6FDxACO0yjN/0B0z240QPg==@vger.kernel.org
X-Gm-Message-State: AFq9FYKOYMS+jLw5LjUEFXdbecB2X0D59FzOdPdiKaDmQyt+fh/6ltag
	BhF2KLk4bEcqz1R72Wh3jgA7WT7HRcIp6aPTgMEJlo0G0sS4NOkMSSs=
X-Gm-Gg: AYBFou3MrUGPcLXXiRgEkL4CaQSsb/uQZeQpngX9Pt7BrmJbJkqH0oKLzqnig6Bkhb9
	JsD2tS7cX7mfbceXDY/CiNH4JU76HLnpbGrZDiB++0lIEtTFkcQ7MVfQP7sE/no+iGXDVF9kZrd
	ylt1nAwOE4Cg7l2J9+0OSbeIspc4VffYXXg+sYBoULyCoXmIx6YHdrU4TrBJIYmMB+dZ03e1MI6
	Tdjg7dQAjZtIgbEQwagulwWY8K9emzt7F+CCtw/mzB71eQsP6RpJDBnSzGFM3lF/WyWgsuAZwe7
	ity6DMClS9zok6VOmWaTP9GCehd6mmi0ryNt6gCyRQ7EsBWNs04ToLd7/rGJBnHVpiJdtGXcRMJ
	zNYvK3KCPt8TIsLOSDYdmohEvA8QCQGnfgrQBOaEGgKQo0Xiw3HJa3L1OBsRVtIK7dwf4OVuDOg
	DqyozJCQxSpnODgO/G1Wl6DK8/fhRiiyOIaQkP4TmpHn7QoXy1QAzrXa+zD4xSvTgg4eQCEwF7L
	VBpTG7GtTQeBRvqNBVio4/ueSaYVYawbHx+H/FlIoz8zBMZkU6bP1AHQpcKkxQXpjsi3iQNrfPS
	zLS12DCDDoS3da/ipcIWhmSfFUWe
X-Received: by 2002:a05:622a:1346:b0:536:352d:65f6 with SMTP id d75a77b69052e-536460a977cmr63623051cf.64.1792291619067;
        Sat, 17 Oct 2026 19:46:59 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91bcba4b9f0sm62019456d6.10.2026.10.17.19.46.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 19:46:58 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Niklas =?UTF-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>,
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH v3 1/2] media: rcar-isp: distinguish absent cores from registration failures
Date: Sat, 17 Oct 2026 22:46:53 -0400
Message-ID: <20261018024654.3913088-2-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261018024654.3913088-1-mhun512@gmail.com>
References: <20261018024654.3913088-1-mhun512@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

risp_probe() interprets -ENODEV from risp_core_probe() as an absent
optional core and continues with the channel selector. Keep that result
for the existing resource-setup fallback, but distinguish it from a
failure after core resources have been initialized.

The following patch moves the core IRQ request after RPPX1 and the
registration state have been initialized. If that request returns
-ENODEV, its error path releases RPPX1 and the VSPX device reference.
Passing -ENODEV back unchanged would make the parent continue probing,
although core->base still indicates a core whose resources have already
been released.

Translate -ENODEV to -ENXIO at the registration error exit, after the
existing cleanup. The parent can then handle the failure using only the
return value, without inspecting core->base. Leave all resource-setup
results unchanged, including the existing fallback when VSPX information
is absent.

This prepares the error handling for the IRQ lifetime fix in the next
patch; it does not depend on an existing -ENODEV return from the V4L2
registration helpers.

This issue was identified during our ongoing research while reviewing
kernel code.

Suggested-by: Niklas Söderlund <niklas.soderlund@ragnatech.se>
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
Changes in v3:
- Express the distinction in the return value, as suggested by Niklas,
  instead of checking core->base in the caller.
- Translate -ENODEV only after resource setup has succeeded, keeping
  existing resource-setup and channel-selector fallback behavior.
- Describe this patch as a prerequisite for the IRQ registration move.

Changes in v2:
- Split the error-handling change out of the IRQ lifetime fix.

v2: https://lore.kernel.org/r/20261015004159.2202899-1-mhun512@gmail.com
v1: https://lore.kernel.org/r/20261011214448.2043581-1-mhun512@gmail.com

Compile-tested with Clang 22.1.2, W=1 (arm64). No runtime testing.

 drivers/media/platform/renesas/rcar-isp/core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/renesas/rcar-isp/core.c b/drivers/media/platform/renesas/rcar-isp/core.c
index 586a5adbedfa8..373d9ca9374fe 100644
--- a/drivers/media/platform/renesas/rcar-isp/core.c
+++ b/drivers/media/platform/renesas/rcar-isp/core.c
@@ -894,7 +894,8 @@ int risp_core_probe(struct rcar_isp_core *core, struct platform_device *pdev,
 err_destroy_rpp:
 	rppx1_destroy(core->rpp);
 	put_device(core->vspx.dev);
-	return ret;
+	/* Do not report a registration failure as an absent core. */
+	return ret == -ENODEV ? -ENXIO : ret;
 }
 
 void risp_core_remove(struct rcar_isp_core *core)
