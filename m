Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C187D3CB8F0
	for <linux-renesas-soc@vger.kernel.org>; Wed, 16 Sep 2026 23:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789603021; cv=none; b=XaW5uxA4ykXc8p9Boa8YLSz91BBsbyn/wPAyU4nNXDTlXhKBGTIhguUbAFP9hddO67DkR5KKhBDnpKewuQ3eFsRUAudrubjjd9bgJGN/+km8hVJzmGFAE7B7T+IOKHkMu8MQbu2GXOUG/KxuxMOcl6roZEjQVBnqMAlD98wev8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789603021; c=relaxed/simple;
	bh=r5fYqS9yRGXCps6te6Fr/X5zmfu7BPID44eZ3cKa5fE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TQ0eapCi9yEQBTlXpZYu0vtHuIRBo6gs1r3tHNHTf5HUt3ul50pNyC7BquJhmkJef+oQ6QoRcN81oDiviBIABWiCgt8PtvFdxijyc+ZgCBCDOb1GjkDuddzLnb3KKgE9eW0G8onjQsMU+zt25hDInh3EWqSW/t3jPFJeJGBijjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=BvQ0pGgD; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="BvQ0pGgD"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3397B512;
	Thu, 17 Sep 2026 01:55:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1789602913;
	bh=r5fYqS9yRGXCps6te6Fr/X5zmfu7BPID44eZ3cKa5fE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BvQ0pGgD14VsweRcBfKGpHhbKWn3do5jDxffy+3hwFUlrGSqV432gDuOdI60Y4nwI
	 hUf9fhOqCcHCj05gyazw2nmdQfkQIdEv0Y14UMDabdbe1fbvnGmhTdohe3FTa21Gvd
	 U/QIWng61kWHn0oDCIVgg7cKHneA3mlrSU2axy3o=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Paul Elder <paul.elder@ideasonboard.com>
Subject: [vsp-tests] [PATCH 4/4] vsp-tests: Print location of unit tests
Date: Thu, 17 Sep 2026 02:56:48 +0300
Message-ID: <20260916235648.261920-5-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260916235648.261920-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20260916235648.261920-1-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now that the VSP test suite can be run from any directory, it becomes
useful for debugging purpose to know what directory the unit tests are
taken from. Print the directory at the beginning of the test suite
execution, using realpath to resolve relative paths.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 scripts/vsp-tests | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/scripts/vsp-tests b/scripts/vsp-tests
index 022477e35b3a..f46a1b45ad04 100755
--- a/scripts/vsp-tests
+++ b/scripts/vsp-tests
@@ -19,7 +19,7 @@
 ##
 
 kernel_version=`uname -r`
-libexec_dir=$(dirname "$0")/../libexec
+libexec_dir=$(realpath $(dirname "$0")/../libexec)
 
 run_test() {
 	local script=$1
@@ -68,6 +68,8 @@ run_suite() {
 	echo "$num_test tests: $num_pass passed, $num_fail failed, $num_skip skipped"
 }
 
+echo "Running tests from $libexec_dir"
+
 for loop in `seq 1 1 $1`; do
 	run_suite $loop
 done;
-- 
Regards,

Laurent Pinchart

