#define APPROVALS_DOCTEST
#include "ApprovalTests.hpp"

#include <memory>
auto defaultReporterDisposer =
        ApprovalTests::Approvals::useAsDefaultReporter(std::make_shared<ApprovalTests::ClipboardReporter>());
