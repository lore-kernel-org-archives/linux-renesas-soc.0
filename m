Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10B14286D70
	for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Oct 2026 00:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792024925; cv=none; b=XgsWGsrVkzhUVwMNlT/0f90WOxe3QP1lqvmvhctn41K9Kpctsdf5PuntjalXleT0XEVEaCGl2LOLA8S85lPuToFRjMRien0hOfwMQlYj207dL1zz2MK7Bt8zPABrBSZLS/SF0so28bjYZJOEEVeBCQUaETy9+kSe0pFlmncLigk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792024925; c=relaxed/simple;
	bh=zKmceE7iJ3pFkJAPAZa69mvHkW/SDXp+nT5N7qLGRy8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=k1zUK4/+YST2JBumHPyW41H2+48nl7VcpOqYiTCTZcE1Cd2kxsCwi+kl3/jOcb3dzRyaVdX/ydn6hPCW8v7+KsgbJ0uY4nihF145wDPchcdmQG5IvN2D4p4olHT282nBDltVZ+r5NGC3iw4pvGn3cSEfYvIq1YqAdJOUihYBATI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XlXk6HXz; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XlXk6HXz"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-917a20e9efeso67154076d6.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Oct 2026 17:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792024923; x=1792629723; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CCmGfQtmli9ezK+MFtUWjQexKDnk5+HZKyUUtdEwtk4=;
        b=XlXk6HXzrChaVnO117/DlsL+SieOlhc8dhjGsLCHgzu8Lx2PK1kUJuh0JlAX0L6cr0
         9zWG3ouqLPokOez/iF+Jf+4hJnQujrMFqRvXgRWEXhy6PH6wBoURYXUaYaBk80bDguVG
         vbuhiLl+y7cqxxHgSqQj1lnVWVmJm87t/qSUzZr87rV66F04ZZTqHDMk87hVlpsLvn7N
         pEwXKPTjRE9YDgFxvFt6TmJAgMbISmxkrKmTPghfiNBwuWqygIWvdrm2kTo+7+nVEQgs
         j0EnR58n0sn53bkx5zXtx7p2DySnGAuZamxDcd1qOsGQQrVKhe2pCLTEsAgplvkdW+mN
         2JYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792024923; x=1792629723;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CCmGfQtmli9ezK+MFtUWjQexKDnk5+HZKyUUtdEwtk4=;
        b=2Piy+xu8LnbdBj2H+EFY+Wf5vjuz+Vm13JAsZF/AGxDmibcF37WNcvGPAhp4/mXyRW
         nb/po6rG0Qm5R89uCK2Zo/dEzh8wTFYj5vAOYC7dRhv8JjHE/CzKGT298poxUeXt9b0K
         TLCFjqBOGyEmEyOFQ3vS0vowJMBHzNw0D6z4mxQ/Cy4TvxQDSMK6q703lUNt0zk6X767
         E11FftY1/dnYiJG0a+Q55zeS4QXFCoqvMqqKpu+UxGydH8VM/0HskEVrem8nGoAZ82Mn
         dmoM4zaxLPBxe7VvJTBx39JRQ+wG7Hemu9/G7XZRKJQijDk8Oa/tbYS6A+/2OFGsHmAR
         7ZOQ==
X-Forwarded-Encrypted: i=1; AKwUvBw7Y9SAhoXjyiW5emqJkH8OY0v3bgM+0nSbdYuQXXR0BZXrTx3tfLFApnhVM89ej01pAzS/73Sc13UKJTyalSMM+w==@vger.kernel.org
X-Gm-Message-State: AFq9FYLT75BjG/VRhbGKZoX2b8aI+aYhP/WQw6djCfK8BkKv3GiH7rfi
	STGAoY5GKKHxqOwUdkSd0CUewqe+h+1AtuF4boS9z1FyEwntGoOyIxY=
X-Gm-Gg: AYBFou0WE4eIdyNi6Dj6/uOwx7w6ug8qk82rgSJJdGOtdF82Mm4sliM6HR2lk9BQPMb
	Uh24YkKNGjgPudbMSebJcuqoe964jJSPR1Hclu/TP08oJBpYnt44JCH5gMsS4N+eFAGHumscIlt
	yOCsE/Cu69y1IPlK85iLahRPvJngFs4R1BZOksRXYOtgMeRnwvzYCQdhytf8/VM5OEMkejQHJQk
	fz6dSaxBVJH6fViPHC8nDWweb8rTWLpx5CrYqaHulinn/bIES/ebxvUrOzG9rFIH/yY01o0E1Rr
	JdAI3UDR7K+KXugX9bWjq1On7tkrWvtoQ9r9h4JtpjMV0ZfzCedtAL4RXYVSnMfxmUgbie8EFT5
	Yq7hP/E8r/WoUgdH1ahJNDZD6Tz/+s/I8C3Vgr1DAjBahB5cUY4Y8VoriowVmFZSbP4cWXU8j+x
	O/ZmQ72KPBIAUZjmO/cnxoIXM7ADRnKZrZlKvQndVurPFvJXOrkeHie4x5gNvj7EqtQGE3DvWVI
	+8hGE/pLTXnAtlCGxK5PJVwesoq6/Lb9whfdO6fb0IfHMYNw2XyNmcaimT9FtfAsDcjPzyEpG+m
	BJbz+jm8voMYRADU
X-Received: by 2002:ad4:5aad:0:b0:912:127b:c56a with SMTP id 6a1803df08f44-91b553398damr291404816d6.2.1792024922795;
        Wed, 14 Oct 2026 17:42:02 -0700 (PDT)
Received: from gmail.com ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b97b7b31esm66811476d6.26.2026.10.14.17.42.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 17:42:01 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: niklas.soderlund@ragnatech.se,
	mchehab@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com
Cc: linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ae878000@gmail.com,
	jacopo.mondi+renesas@ideasonboard.com,
	sakari.ailus@linux.intel.com
Subject: [PATCH v2 0/2] media: rcar-isp: fix core registration and IRQ lifetime
Date: Wed, 14 Oct 2026 20:41:57 -0400
Message-ID: <20261015004159.2202899-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The ISP core IRQ is registered before the RPPX1 object and interrupt
handler state are initialized. On removal, it remains registered until
after the RPPX1 object has been freed. An interrupt handler can therefore
access RPPX1 outside its lifetime.

This series requests the IRQ after its dependencies are initialized and
releases it before destroying RPPX1. It also distinguishes an absent
optional core from a registration failure after core resources have been
prepared.

Patch 1 handles the -ENODEV distinction. Patch 2 moves IRQ registration
and release within the RPPX1 lifetime. The error-handling change comes
first so a failure from the later IRQ request cannot be mistaken for an
absent core after registration has unwound.

Compile-tested with Clang 22.1.2, W=1 (arm64). No runtime testing.

Changes in v2:
- Split the -ENODEV handling into patch 1.
- Explain the RPPX1 allocation, free and pre-lock IRQ accesses in patch 2.
- Combined code changes are identical to v1.

v1: https://lore.kernel.org/r/20261011214448.2043581-1-mhun512@gmail.com

Myeonghun Pak (2):
  media: rcar-isp: distinguish absent cores from registration failures
  media: rcar-isp: release the core interrupt before destroying RPPX1

 drivers/media/platform/renesas/rcar-isp/core.c      | 13 +++++++++----
 drivers/media/platform/renesas/rcar-isp/csisp.c     |  2 ++
 drivers/media/platform/renesas/rcar-isp/risp-core.h |  2 ++
 3 files changed, 13 insertions(+), 4 deletions(-)

base-commit: 238650ef6c7c7cca08e032527329424c9fbd70e5
