Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:40336 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753819AbdEHR3r (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 8 May 2017 13:29:47 -0400
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org, geert@glider.be
Subject: [GIT PULL for renesas-drivers] VSP DRM Race V4
Date: Mon,  8 May 2017 18:29:42 +0100
Message-Id: <1494264582-23667-1-git-send-email-kieran.bingham+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

Please consider the following pull request for renesas-drivers.

--
Kieran


The following changes since commit 13e0988140374123bead1dd27c287354cb95108e:

  docs: complete bumping minimal GNU Make version to 3.81 (2017-05-06 18:49:09 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/kbingham/rcar.git tags/submissions/vsp-drm-race/v4

for you to fetch changes up to ca41dc36340276e09767ea8c828031ae33bcf662:

  drm: rcar-du: Register a completion callback with VSP1 (2017-05-08 15:14:38 +0100)

----------------------------------------------------------------
The RCAR-DU utilises a running VSPD pipeline to perform processing for the
display pipeline. This presents the opportunity for some race conditions to
affect the quality of the display output.

To prevent reporting page flips early, we must track this timing through the
VSP1, and only allow the rcar-du object to report the page-flip completion
event after the VSP1 has processed.

This series ensures that tearing and flicker is prevented, without introducing
any (substantial) performance impact.

These patches have been tested by introducing artificial delays in the commit
code paths and verifying that no visual tearing or flickering occurs.

Extensive testing around the race window has been performed by dynamically
adapting the artificial delay between 15, and 17 seconds in 100uS increments
for periods of 5 seconds on each delay test. These tests have successfully run
for 3 hours.

Manual start/stop testing has also been performed.

Mauro: As this patchset covers two subsystems, and the DRM/DU side is dependant
upon the media/VSP side, If you are happy with these patches, Would it be
possible to get acks from you for integration through the DRM tree please?

Regards

Kieran

Kieran Bingham (3):
  v4l: vsp1: Postpone frame end handling in event of display list race
  v4l: vsp1: Extend VSP1 module API to allow DRM callbacks
  drm: rcar-du: Register a completion callback with VSP1

Laurent Pinchart (1):
  drm: rcar-du: Arm the page flip event after queuing the page flip

 drivers/gpu/drm/rcar-du/rcar_du_crtc.c  | 30 ++++++++++++++------------
 drivers/gpu/drm/rcar-du/rcar_du_crtc.h  |  1 +-
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c   |  9 ++++++++-
 drivers/media/platform/vsp1/vsp1_dl.c   | 19 ++++++++++++++--
 drivers/media/platform/vsp1/vsp1_dl.h   |  2 +-
 drivers/media/platform/vsp1/vsp1_drm.c  | 17 +++++++++++++++-
 drivers/media/platform/vsp1/vsp1_drm.h  | 11 ++++++++++-
 drivers/media/platform/vsp1/vsp1_pipe.c | 13 ++++++++++-
 include/media/vsp1.h                    |  7 ++++++-
 9 files changed, 92 insertions(+), 17 deletions(-)

----------------------------------------------------------------
